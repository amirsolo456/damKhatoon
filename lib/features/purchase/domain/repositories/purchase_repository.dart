// features/purchase/data/datasources/purchase_local_data_source.dart
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';



abstract class IPurchaseRepository {
  // Purchase Invoices
  Future<List<PurchaseInvoiceModel>> getCachedInvoices();
  Future<void> cacheInvoices(List<PurchaseInvoiceModel> invoices);
  Future<void> removeInvoice(String id);
  Future<void> updateInvoice(PurchaseInvoiceModel invoice);

  // Payments
  Future<void> cachePayment(String invoiceId, PaymentModel payment);
  Future<List<PaymentModel>> getCachedPayments(String invoiceId);
  Future<void> removePayment(String paymentId);
  Future<void> updatePayment(PaymentModel payment);


  // Deliveries
  Future<void> cacheDelivery(String invoiceId, DeliveryModel delivery);
  Future<List<DeliveryModel>> getCachedDeliveries(String invoiceId);
  Future<void> removeDelivery(String deliveryId);
  Future<void> updateDelivery(DeliveryModel delivery);

}