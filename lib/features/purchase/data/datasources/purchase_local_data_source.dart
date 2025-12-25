import 'dart:convert';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:khatoon_container/core/errors/exceptions.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';

abstract class IPurchaseLocalDataSource {
  // Purchase Invoices - CREATE & READ operations
  Future<void> createInvoice(PurchaseInvoiceModel invoice);

  Future<List<PurchaseInvoiceModel>> getCachedInvoices();

  Future<PurchaseInvoiceModel?> getInvoiceById(int id);

  Future<void> updateInvoice(PurchaseInvoiceModel invoice);

  Future<void> removeInvoice(int id);

  Future<void> cacheInvoices(List<PurchaseInvoiceModel> invoices);

  Future<void> clearAllInvoices();

  // Payments - CREATE & READ operations
  Future<void> createPayment(int invoiceId, PaymentModel payment);

  Future<void> cachePayment(int invoiceId, PaymentModel payment);

  Future<List<PaymentModel>> getCachedPayments(int invoiceId);

  Future<PaymentModel?> getPaymentById(int paymentId);

  Future<void> updatePayment(PaymentModel payment);

  Future<void> removePayment(int paymentId);

  Future<void> clearPayments(int invoiceId);

  // Deliveries - CREATE & READ operations
  Future<void> createDelivery(int invoiceId, DeliveryModel delivery);

  Future<void> cacheDelivery(int invoiceId, DeliveryModel delivery);

  Future<List<DeliveryModel>> getCachedDeliveries(int invoiceId);

  Future<DeliveryModel?> getDeliveryById(int deliveryId);

  Future<void> updateDelivery(DeliveryModel delivery);

  Future<void> removeDelivery(int deliveryId);

  Future<void> clearDeliveries(int invoiceId);
}

class PurchaseLocalDataSource implements IPurchaseLocalDataSource {
  static const String _invoicesKey = 'cached_invoices';
  static const String _paymentsKeyPrefix = 'payments_';
  static const String _deliveriesKeyPrefix = 'deliveries_';

  final SharedPreferences sharedPreferences;

  PurchaseLocalDataSource({required this.sharedPreferences});

  // ========== Purchase Invoices Methods ==========

  @override
  Future<void> createInvoice(PurchaseInvoiceModel invoice) async {
    try {
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      invoices.add(invoice);
      await _saveInvoices(invoices);
    } catch (e) {
      throw CacheException(message: 'خطا در ایجاد فاکتور در کش محلی');
    }
  }

  @override
  Future<List<PurchaseInvoiceModel>> getCachedInvoices() async {
    try {
      final String? jsonString = sharedPreferences.getString(_invoicesKey);
      if (jsonString == null) return <PurchaseInvoiceModel>[];

      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => PurchaseInvoiceModel.fromJson(json))
          .toList();
    } catch (e) {
      throw CacheException(message: 'خطا در خواندن فاکتورها از کش محلی');
    }
  }

  @override
  Future<PurchaseInvoiceModel?> getInvoiceById(int id) async {
    try {
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      return invoices.firstWhere((PurchaseInvoiceModel invoice) => invoice.id == id);
    } catch (e) {
      throw CacheException(message: 'خطا در پیدا کردن فاکتور');
    }
  }

  @override
  Future<void> updateInvoice(PurchaseInvoiceModel updatedInvoice) async {
    try {
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      final int index = invoices.indexWhere(
        (PurchaseInvoiceModel invoice) => invoice.id == updatedInvoice.id,
      );

      if (index != -1) {
        invoices[index] = updatedInvoice;
        await _saveInvoices(invoices);
      }
    } catch (e) {
      throw CacheException(message: 'خطا در به‌روزرسانی فاکتور در کش محلی');
    }
  }

  @override
  Future<void> removeInvoice(int id) async {
    try {
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      invoices.removeWhere((PurchaseInvoiceModel invoice) => invoice.id == id);
      await _saveInvoices(invoices);
    } catch (e) {
      throw CacheException(message: 'خطا در حذف فاکتور از کش محلی');
    }
  }

  @override
  Future<void> cacheInvoices(List<PurchaseInvoiceModel> invoices) async {
    try {
      await _saveInvoices(invoices);
    } catch (e) {
      throw CacheException(message: 'خطا در ذخیره فاکتورها در کش محلی');
    }
  }

  @override
  Future<void> clearAllInvoices() async {
    try {
      await sharedPreferences.remove(_invoicesKey);
    } catch (e) {
      throw CacheException(message: 'خطا در پاک کردن همه فاکتورها');
    }
  }

  Future<void> _saveInvoices(List<PurchaseInvoiceModel> invoices) async {
    final List<Map<String, dynamic>> jsonList = invoices.map((PurchaseInvoiceModel invoice) => invoice.toJson()).toList();
    final String jsonString = json.encode(jsonList);
    await sharedPreferences.setString(_invoicesKey, jsonString);
  }

  // ========== Payments Methods ==========

  @override
  Future<void> createPayment(int invoiceId, PaymentModel payment) async {
    try {
      final List<PaymentModel> payments = await getCachedPayments(invoiceId);
      payments.add(payment);
      await _savePayments(invoiceId, payments);
    } catch (e) {
      throw CacheException(message: 'خطا در ایجاد پرداخت در کش محلی');
    }
  }

  @override
  Future<void> cachePayment(int invoiceId, PaymentModel payment) async {
    await createPayment(invoiceId, payment);
  }

  @override
  Future<List<PaymentModel>> getCachedPayments(int invoiceId) async {
    try {
      final String key = '$_paymentsKeyPrefix$invoiceId';
      final String? jsonString = sharedPreferences.getString(key);
      if (jsonString == null) return <PaymentModel>[];

      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => PaymentModel.fromJson(json)).toList();
    } catch (e) {
      throw CacheException(message: 'خطا در خواندن پرداخت‌ها از کش محلی');
    }
  }

  @override
  Future<PaymentModel?> getPaymentById(int paymentId) async {
    try {
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();

      for (final PurchaseInvoiceModel invoice in invoices) {
          final PaymentModel payment = invoice.payments.firstWhere(
              (PaymentModel p) => p.id == paymentId,
        );
        return payment;
      }
      return null;
    } catch (e) {
      throw CacheException(message: 'خطا در پیدا کردن پرداخت');
    }
  }

  @override
  Future<void> updatePayment(PaymentModel updatedPayment) async {
    try {
      // Get all invoices
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      bool found = false;

      for (final PurchaseInvoiceModel invoice in invoices) {
        final int index = invoice.payments.indexWhere(
          (PaymentModel p) => p.id == updatedPayment.id,
        );
        if (index != -1) {
          // Create a new list with updated payment
          final List<PaymentModel> updatedPayments = List<PaymentModel>.from(invoice.payments);
          updatedPayments[index] = updatedPayment;

          // Update invoice with new payments list
          final PurchaseInvoiceModel updatedInvoice = PurchaseInvoiceModel(
            id: invoice.id,
            sellerId: invoice.sellerId,
            sellerName: invoice.sellerName,
            notes: invoice.notes,
            date: invoice.date,
            status: invoice.status,
            totalAmount: invoice.totalAmount,
            paidAmount: invoice.paidAmount,
            paymentStatus: invoice.paymentStatus,
            deliveryStatus: invoice.deliveryStatus,
            isSettled: invoice.isSettled,
            deliveries: invoice.deliveries,
            items: invoice.items,
            payments: updatedPayments,
          );

          await updateInvoice(updatedInvoice);
          found = true;
          break;
        }
      }

      if (!found) {
        throw CacheException(message: 'پرداخت مورد نظر پیدا نشد');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'خطا در به‌روزرسانی پرداخت در کش محلی');
    }
  }

  @override
  Future<void> removePayment(int paymentId) async {
    try {
      // Get all invoices
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      bool found = false;

      for (final PurchaseInvoiceModel invoice in invoices) {
        final int paymentIndex = invoice.payments.indexWhere(
          (PaymentModel p) => p.id == paymentId,
        );
        if (paymentIndex != -1) {
          // Create a new list without the payment
          final List<PaymentModel> updatedPayments = List<PaymentModel>.from(invoice.payments);
          updatedPayments.removeAt(paymentIndex);

          // Update invoice with new payments list
          final PurchaseInvoiceModel updatedInvoice = PurchaseInvoiceModel(
            id: invoice.id,
            sellerId: invoice.sellerId,
            sellerName: invoice.sellerName,
            notes: invoice.notes,
            date: invoice.date,
            status: invoice.status,
            totalAmount: invoice.totalAmount,
            paidAmount: invoice.paidAmount,
            paymentStatus: invoice.paymentStatus,
            deliveryStatus: invoice.deliveryStatus,
            isSettled: invoice.isSettled,
            deliveries: invoice.deliveries,
            items: invoice.items,
            payments: updatedPayments,
          );

          await updateInvoice(updatedInvoice);
          found = true;
          break;
        }
      }

      if (!found) {
        throw CacheException(message: 'پرداخت مورد نظر پیدا نشد');
      }
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException(message: 'خطا در حذف پرداخت از کش محلی');
    }
  }

  @override
  Future<void> clearPayments(int invoiceId) async {
    try {
      final String key = '$_paymentsKeyPrefix$invoiceId';
      await sharedPreferences.remove(key);
    } catch (e) {
      throw CacheException(message: 'خطا در پاک کردن پرداخت‌ها');
    }
  }

  Future<void> _savePayments(
      int invoiceId,
    List<PaymentModel> payments,
  ) async {
    final String key = '$_paymentsKeyPrefix$invoiceId';
    final List<Map<String, dynamic>> jsonList = payments.map((PaymentModel payment) => payment.toJson()).toList();
    final String jsonString = json.encode(jsonList);
    await sharedPreferences.setString(key, jsonString);
  }

  // ========== Deliveries Methods ==========

  @override
  Future<void> createDelivery(int invoiceId, DeliveryModel delivery) async {
    try {
      final List<DeliveryModel> deliveries = await getCachedDeliveries(invoiceId);
      deliveries.add(delivery);
      await _saveDeliveries(invoiceId, deliveries);
    } catch (e) {
      throw CacheException(message: 'خطا در ایجاد تحویل در کش محلی');
    }
  }

  @override
  Future<void> cacheDelivery(int invoiceId, DeliveryModel delivery) async {
    await createDelivery(invoiceId, delivery);
  }

  @override
  Future<List<DeliveryModel>> getCachedDeliveries(int invoiceId) async {
    try {
      final String key = '$_deliveriesKeyPrefix$invoiceId';
      final String? jsonString = sharedPreferences.getString(key);
      if (jsonString == null) return <DeliveryModel>[];

      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => DeliveryModel.fromJson(json)).toList();
    } catch (e) {
      throw CacheException(message: 'خطا در خواندن تحویل‌ها از کش محلی');
    }
  }

  @override
  Future<DeliveryModel?> getDeliveryById(int deliveryId) async {
    try {
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();

      for (final PurchaseInvoiceModel invoice in invoices) {
        for (final DeliveryModel delivery in invoice.deliveries) {
          if (delivery.id == deliveryId) {
            return delivery;
          }
        }
      }
      return null;
    } catch (e) {
      throw CacheException(message: 'خطا در پیدا کردن تحویل');
    }
  }

  @override
  Future<void> updateDelivery(DeliveryModel updatedDelivery) async {
    try {
      // This would require similar logic to updatePayment
      // For simplicity, we'll remove and re-add
      await removeDelivery(updatedDelivery.id);

      // Find which invoice this delivery belongs to
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();
      for (final PurchaseInvoiceModel invoice in invoices) {
        if (invoice.deliveries.any((DeliveryModel d) => d.id == updatedDelivery.id)) {
          await createDelivery(invoice.id, updatedDelivery);
          break;
        }
      }
    } catch (e) {
      throw CacheException(message: 'خطا در به‌روزرسانی تحویل در کش محلی');
    }
  }

  @override
  Future<void> removeDelivery(int deliveryId) async {
    try {
      // Similar to removePayment logic
      final List<PurchaseInvoiceModel> invoices = await getCachedInvoices();

      for (final PurchaseInvoiceModel invoice in invoices) {
        final int deliveryIndex = invoice.deliveries.indexWhere(
          (DeliveryModel d) => d.id == deliveryId,
        );
        if (deliveryIndex != -1) {
          // Create a new list without the delivery
          final List<DeliveryModel> updatedDeliveries = List<DeliveryModel>.from(
            invoice.deliveries,
          );
          updatedDeliveries.removeAt(deliveryIndex);

          // Update invoice
          final PurchaseInvoiceModel updatedInvoice = PurchaseInvoiceModel(
            id: invoice.id,
            sellerId: invoice.sellerId,
            sellerName: invoice.sellerName,
            notes: invoice.notes,
            date: invoice.date,
            status: invoice.status,
            totalAmount: invoice.totalAmount,
            paidAmount: invoice.paidAmount,
            paymentStatus: invoice.paymentStatus,
            deliveryStatus: invoice.deliveryStatus,
            isSettled: invoice.isSettled,
            deliveries: updatedDeliveries,
            items: invoice.items,
            payments: invoice.payments,
          );

          await updateInvoice(updatedInvoice);
          break;
        }
      }
    } catch (e) {
      throw CacheException(message: 'خطا در حذف تحویل از کش محلی');
    }
  }

  @override
  Future<void> clearDeliveries(int invoiceId) async {
    try {
      final String key = '$_deliveriesKeyPrefix$invoiceId';
      await sharedPreferences.remove(key);
    } catch (e) {
      throw CacheException(message: 'خطا در پاک کردن تحویل‌ها');
    }
  }

  Future<void> _saveDeliveries(
      int invoiceId,
    List<DeliveryModel> deliveries,
  ) async {
    final String key = '$_deliveriesKeyPrefix$invoiceId';
    final List<Map<String, dynamic>> jsonList = deliveries.map((DeliveryModel delivery) => delivery.toJson()).toList();
    final String jsonString = json.encode(jsonList);
    await sharedPreferences.setString(key, jsonString);
  }
}
