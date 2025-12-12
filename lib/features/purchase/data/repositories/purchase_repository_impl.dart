import 'package:khatoon_container/features/purchase/data/datasources/purchase_local_data_source.dart';
import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/domain/repositories/purchase_repository.dart'
    hide PurchaseLocalDataSource;

class PurchaseRepository implements IPurchaseRepository {
  final PurchaseRemoteDataSource remoteDataSource;
  final PurchaseLocalDataSource localDataSource;

  // Constructor با پارامترهای required
  const PurchaseRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<void> cacheDelivery(String invoiceId, DeliveryModel delivery) {
    // TODO: implement cacheDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> cacheInvoices(List<PurchaseInvoiceModel> invoices) {
    // TODO: implement cacheInvoices
    throw UnimplementedError();
  }

  @override
  Future<void> cachePayment(String invoiceId, PaymentModel payment) {
    // TODO: implement cachePayment
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryModel>> getCachedDeliveries(String invoiceId) {
    // TODO: implement getCachedDeliveries
    throw UnimplementedError();
  }

  @override
  Future<List<PurchaseInvoiceModel>> getCachedInvoices() {
    // TODO: implement getCachedInvoices
    throw UnimplementedError();
  }

  @override
  Future<List<PaymentModel>> getCachedPayments(String invoiceId) {
    // TODO: implement getCachedPayments
    throw UnimplementedError();
  }

  @override
  Future<void> removeDelivery(String deliveryId) {
    // TODO: implement removeDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> removeInvoice(String id) {
    // TODO: implement removeInvoice
    throw UnimplementedError();
  }

  @override
  Future<void> removePayment(String paymentId) {
    // TODO: implement removePayment
    throw UnimplementedError();
  }

  @override
  Future<void> updateDelivery(DeliveryModel delivery) {
    // TODO: implement updateDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> updateInvoice(PurchaseInvoiceModel invoice) {
    // TODO: implement updateInvoice
    throw UnimplementedError();
  }

  @override
  Future<void> updatePayment(PaymentModel payment) {
    // TODO: implement updatePayment
    throw UnimplementedError();
  }
}
