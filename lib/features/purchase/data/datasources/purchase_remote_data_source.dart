import 'package:dio/dio.dart';
import 'package:khatoon_container/core/errors/exceptions.dart';
import 'package:khatoon_container/features/purchase/data/models/order/order_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';

abstract class IPurchaseRemoteDataSource {
  Future<List<PurchaseInvoiceModel>> getPurchases();

  Future<PurchaseInvoiceModel> getPurchaseInvoicesByPurchaseId(int purchaseId);

  Future<List<PurchaseItemModel>> getPurchaseItemsByPurchaseId(int purchaseId);

  Future<List<OrderModel>> getOrdersByPurchaseId(int orderId);

  Future<List<PaymentModel>> getPaymentsByPurchaseId(int purchaseId);

  Future<List<DeliveryModel>> getDeliveriesByPurchaseId(int purchaseId);

  Future<void> createPurchase(PurchaseInvoiceModel purchase);

  Future<void> createPurchaseItem(
    PurchaseInvoiceModel purchase,
    PurchaseItemModel purchaseItem,
  );

  Future<void> createOrders(
    PurchaseInvoiceModel purchase,
    List<OrderModel> order,
  );

  Future<void> createOrder(PurchaseInvoiceModel purchase, OrderModel order);

  Future<void> createPayment(
    PurchaseInvoiceModel purchase,
    PaymentModel payment,
  );

  Future<void> createPayments(
    PurchaseInvoiceModel purchase,
    List<PaymentModel> payments,
  );

  Future<void> createDelivery(
    PurchaseInvoiceModel purchase,
    DeliveryModel delivery,
  );

  Future<void> createDeliveries(
    PurchaseInvoiceModel purchaseId,
    List<DeliveryModel> delivery,
  );

  Future<void> createItem(int purchaseId, PurchaseItemModel item);

  Future<void> updatePurchase(PurchaseInvoiceModel purchase);

  Future<void> updatePurchaseItem(PurchaseItemModel purchaseItem);

  Future<void> updateOrder(OrderModel order);

  Future<void> updatePayment(PaymentModel payment);

  Future<void> updateDelivery(DeliveryModel delivery);

  Future<void> deletePurchase(PurchaseInvoiceModel purchase);

  Future<void> deletePurchaseItem(PurchaseItemModel purchaseItem);

  Future<void> deletePurchaseItemsById(int purchaseId);

  Future<void> deletePayment(PaymentModel payment);

  Future<void> deletePaymentsById(int purchaseId);

  Future<void> deleteOrder(OrderModel order);

  Future<void> deleteOrdersById(int purchaseId);

  Future<void> deleteDeliveriesById(int purchaseId);

  Future<void> deleteDelivery(DeliveryModel delivery);
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
  Future<PurchaseInvoiceModel> createPurchase(
    PurchaseInvoiceModel purchase,
  ) async {
    try {
      final response = await dioClient.post(
        '/purchases',
        data: purchase.toJson(),
      );
      return PurchaseInvoiceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ایجاد فاکتور خرید');
    }
  }

  @override
  Future<PurchaseInvoiceModel> updatePurchase(
    PurchaseInvoiceModel purchase,
  ) async {
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
  Future<void> deletePurchase(PurchaseInvoiceModel purchase) async {
    try {
      await dioClient.delete('/purchases/$purchase');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف فاکتور خرید');
    }
  }

  @override
  Future<void> deletePurchaseItem(PurchaseItemModel purchaseItem) async {
    try {
      await dioClient.delete('/purchaseItem/$purchaseItem');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف فاکتور خرید');
    }
  }



  @override
  Future<void> createPayment(
    PurchaseInvoiceModel purchase,
    PaymentModel payment,
  ) async {
    try {
      final response = await dioClient.post(
        '/purchases/${purchase.id}/payments',
        data: payment.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت پرداخت');
    }
  }

  @override
  Future<void> createPayments(
    PurchaseInvoiceModel purchase,
    List<PaymentModel> payments,
  ) async {
    try {
      final response = await dioClient.post(
        '/purchases/${purchase.id}/payments',
        data: payments,
      );
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت پرداخت');
    }
  }

  @override
  Future<List<PaymentModel>> getPaymentsByPurchaseId(int purchaseId) async {
    try {
      final response = await dioClient.get('/purchases/$purchaseId/payments');
      final List<dynamic> data = response.data;
      return data.map((json) => PaymentModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت پرداخت‌ها');
    }
  }

  @override
  Future<void> createDelivery(
    PurchaseInvoiceModel purchaseId,
    DeliveryModel delivery,
  ) async {
    try {
      final response = await dioClient.post(
        '/purchases/$purchaseId/deliveries',
        data: delivery.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت تحویل');
    }
  }

  @override
  Future<List<DeliveryModel>> getDeliveriesByPurchaseId(int purchaseId) async {
    try {
      final response = await dioClient.get('/purchases/$purchaseId/deliveries');
      final List<dynamic> data = response.data;
      return data.map((json) => DeliveryModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت تحویل‌ها');
    }
  }

  @override
  Future<void> createItem(int purchaseId, PurchaseItemModel item) async {
    try {
      final response = await dioClient.post(
        '/purchases/$purchaseId/items',
        data: item.toJson(),
      );
      PurchaseItemModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در ثبت آیتم');
    }
  }

  @override
  Future<List<PurchaseItemModel>> getPurchaseItemsByPurchaseId(
    int purchaseId,
  ) async {
    try {
      final response = await dioClient.get('/purchases/$purchaseId/items');
      final List<dynamic> data = response.data;
      return data.map((json) => PurchaseItemModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در دریافت آیتم‌ها');
    }
  }

  @override
  Future<PurchaseInvoiceModel> getPurchaseInvoicesByPurchaseId(int purchaseId) {
    // TODO: implement getPurchaseByInvoiceId
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrder(OrderModel order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<void> createOrder(PurchaseInvoiceModel purchase, OrderModel order) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getOrdersByPurchaseId(int orderId) {
    // TODO: implement getOrdersByPurchaseId
    throw UnimplementedError();
  }

  @override
  Future<void> deletePayment(PaymentModel payment) {
    // TODO: implement deletePayment
    throw UnimplementedError();
  }

  @override
  Future<void> createDeliveries(
    PurchaseInvoiceModel purchaseId,
    List<DeliveryModel> delivery,
  ) {
    // TODO: implement createDeliveries
    throw UnimplementedError();
  }

  @override
  Future<void> createOrders(
    PurchaseInvoiceModel purchase,
    List<OrderModel> order,
  ) {
    // TODO: implement createOrders
    throw UnimplementedError();
  }

  @override
  Future<void> createPurchaseItem(
    PurchaseInvoiceModel purchase,
    PurchaseItemModel purchaseItem,
  ) {
    // TODO: implement createPurchaseItem
    throw UnimplementedError();
  }

  @override
  Future<void> updatePurchaseItem(PurchaseItemModel purchaseItem) {
    // TODO: implement updatePurchaseItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrder(OrderModel order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  @override
  Future<void> updatePayment(PaymentModel payment) {
    // TODO: implement updatePayment
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDeliveriesById(int purchaseId) async {
    try {
      await dioClient.delete('/deliveries/$purchaseId');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف تحویل');
    }
  }

  @override
  Future<void> deleteDelivery(DeliveryModel delivery) async {
    try {
      await dioClient.delete('/deliveries/$delivery');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف تحویل');
    }
  }

  @override
  Future<void> deleteOrdersById(int purchaseId) {
    // TODO: implement deleteOrdersById
    throw UnimplementedError();
  }

  @override
  Future<void> deletePaymentsById(int purchaseId) async {
    try {
      await dioClient.delete('/payments/$purchaseId');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'خطا در حذف پرداخت');
    }
  }

  @override
  Future<void> updateDelivery(DeliveryModel delivery) {
    // TODO: implement updateDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> deletePurchasesById(int purchaseId) {
    // TODO: implement deletePurchasesById
    throw UnimplementedError();
  }

  @override
  Future<void> deletePurchaseItemsById(int purchaseId) {
    // TODO: implement deletePurchaseItemsById
    throw UnimplementedError();
  }
}
