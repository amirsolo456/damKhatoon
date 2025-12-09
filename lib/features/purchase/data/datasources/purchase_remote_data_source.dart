import 'package:dio/dio.dart';
import 'package:khatoon_container/core/errors/exceptions.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item_model.dart';

abstract class IPurchaseRemoteDataSource {
  Future<List<PurchaseInvoiceModel>> getPurchases();
  Future<List<PurchaseInvoiceModel>> getPurchaseById(String purchaseId);
  Future<List<PurchaseInvoiceModel>> getInvoicesByPurchaseId(String purchaseId);
  Future<List<PaymentModel>> getPaymentsByPurchaseId(String purchaseId);
  Future<List<DeliveryModel>> getDeliveriesByPurchaseId(String purchaseId);
   Future<List<PurchaseItemModel>> getItems(String purchaseId);
  Future<PurchaseInvoiceModel> createPurchase(PurchaseInvoiceModel purchase);
  Future<PaymentModel> createPayment(String purchaseId, PaymentModel payment);
  Future<DeliveryModel> createDelivery(String purchaseId, DeliveryModel delivery);
  Future<PurchaseItemModel> createItem(String purchaseId, PurchaseItemModel item);
  Future<PurchaseInvoiceModel> updatePurchase(PurchaseInvoiceModel purchase);
  Future<void> deletePurchase(String id);
  Future<void> deletePayment(String paymentId);
  Future<void> deleteDelivery(String deliveryId);
  Future<void> deleteItem(String itemId);
}

class PurchaseRemoteDataSource implements IPurchaseRemoteDataSource {
  final Dio dioClient;

  PurchaseRemoteDataSource({required this.dioClient});

  @override
  Future<List<PurchaseInvoiceModel>> getPurchases() async {
    try {
      final response = await dioClient.get('/purchases');
      final List<dynamic> data = response.data;
      return data.map((json) => PurchaseInvoiceModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت داده‌ها');
    }
  }

  @override
  Future<PurchaseInvoiceModel> createPurchase(PurchaseInvoiceModel purchase) async {
    try {
      final response = await dioClient.post(
        '/purchases',
        data: purchase.toJson(),
      );
      return PurchaseInvoiceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'خطا در ایجاد فاکتور خرید',
      );
    }
  }

  @override
  Future<PurchaseInvoiceModel> updatePurchase(PurchaseInvoiceModel purchase) async {
    try {
      final response = await dioClient.put(
        '/purchases/${purchase.id}',
        data: purchase.toJson(),
      );
      return PurchaseInvoiceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'خطا در به‌روزرسانی فاکتور خرید',
      );
    }
  }

  @override
  Future<void> deletePurchase(String id) async {
    try {
      await dioClient.delete('/purchases/$id');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف فاکتور خرید');
    }
  }

  @override
  Future<PaymentModel> createPayment(String purchaseId, PaymentModel payment) async {
    try {
      final response = await dioClient.post(
        '/purchases/$purchaseId/payments',
        data: payment.toJson(),
      );
      return PaymentModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت پرداخت');
    }
  }

  @override
  Future<void> deletePayment(String paymentId) async {
    try {
      await dioClient.delete('/payments/$paymentId');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف پرداخت');
    }
  }

  @override
  Future<List<PaymentModel>> getPaymentsByPurchaseId(String purchaseId) async {
    try {
      final response = await dioClient.get('/purchases/$purchaseId/payments');
      final List<dynamic> data = response.data;
      return data.map((json) => PaymentModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت پرداخت‌ها');
    }
  }

  @override
  Future<DeliveryModel> createDelivery(String purchaseId, DeliveryModel delivery) async {
    try {
      final response = await dioClient.post(
        '/purchases/$purchaseId/deliveries',
        data: delivery.toJson(),
      );
      return DeliveryModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت تحویل');
    }
  }

  @override
  Future<void> deleteDelivery(String deliveryId) async {
    try {
      await dioClient.delete('/deliveries/$deliveryId');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف تحویل');
    }
  }

  @override
  Future<List<DeliveryModel>> getDeliveriesByPurchaseId(String purchaseId) async {
    try {
      final response = await dioClient.get('/purchases/$purchaseId/deliveries');
      final List<dynamic> data = response.data;
      return data.map((json) => DeliveryModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت تحویل‌ها');
    }
  }

  @override
  Future<PurchaseItemModel> createItem(String purchaseId, PurchaseItemModel item) async {
    try {
      final response = await dioClient.post(
        '/purchases/$purchaseId/items',
        data: item.toJson(),
      );
      return PurchaseItemModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت آیتم');
    }
  }

  @override
  Future<void> deleteItem(String itemId) async {
    try {
      await dioClient.delete('/items/$itemId');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف آیتم');
    }
  }

  @override
  Future<List<PurchaseItemModel>> getItems(String purchaseId) async {
    try {
      final response = await dioClient.get('/purchases/$purchaseId/items');
      final List<dynamic> data = response.data;
      return data.map((json) => PurchaseItemModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت آیتم‌ها');
    }
  }

  @override
  Future<List<PurchaseInvoiceModel>> getPurchaseById(String purchaseId) {
    // TODO: implement getPurchaseById
    throw UnimplementedError();
  }

  @override
  Future<List<PurchaseInvoiceModel>> getInvoicesByPurchaseId(String purchaseId) {
    // TODO: implement getPurchaseByInvoiceId
    throw UnimplementedError();
  }
}