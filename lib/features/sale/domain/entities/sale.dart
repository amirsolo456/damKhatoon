// مدل جامع‌تر
import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/repositories/purchase_repository_impl.dart';
import 'package:khatoon_container/features/purchase/domain/entities/delivery.dart';
import 'package:khatoon_container/features/purchase/domain/entities/order.dart';
import 'package:khatoon_container/features/purchase/domain/entities/payment.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';

class Sale {
  final Order purchaseOrder;
  final List<PurchaseInvoice> invoices;
  final List<Delivery> deliveries;
  final List<Payment> payments;

  const Sale({
    required this.purchaseOrder,
    required this.invoices,
    required this.deliveries,
    required this.payments,
  });

  // محاسبه مانده پرداخت
  double get remainingBalance {
    final totalInvoiced = invoices.fold(
      0.0,
      (sum, invoice) => sum + invoice.totalAmount,
    );
    final totalPaid = payments.fold(
      0.0,
      (sum, payment) => sum + payment.totalAmount,
    );
    return totalInvoiced - totalPaid;
  }

  // وضعیت کلی
  // PurchaseStatus get overallStatus {
  //   if (deliveries.isEmpty) return PurchaseStatus.pending;
  //   if (remainingBalance > 0) return PurchaseStatus.partiallyPaid;
  //   return PurchaseStatus.completed;
  // }
}

// UseCase برای گرفتن تمام اطلاعات یک Purchase
class GetPurchaseDetailsUseCase {
  final PurchaseRemoteDataSource repository;

  Future<Sale> execute(String purchaseId) async {
    final purchase = await repository.getPurchaseById(purchaseId);
    final invoices = await repository.getInvoicesByPurchaseId(purchaseId);
    final deliveries = await repository.getDeliveriesByPurchaseId(purchaseId);
    final payments = await repository.getPaymentsByPurchaseId(purchaseId);
    final orders = await repository.get(purchaseId);

    return Sale(
      purchaseOrder: orders,
      invoices: invoices,
      deliveries: deliveries,
      payments: payments,
    );
  }
}

// UseCase برای گرفتن پرداخت‌های یک Invoice خاص
class GetPaymentsByInvoiceUseCase {
  final PurchaseRepository repository;

  Future<List<Payment>> execute(String invoiceId) async {
    return await repository.getPaymentsByInvoiceId(invoiceId);
  }
}

// UseCase برای گرفتن Invoiceهای یک Purchase
class GetInvoicesByPurchaseUseCase {
  final PurchaseRepository repository;

  Future<List<Invoice>> execute(String purchaseId) async {
    return await repository.getInvoicesByPurchaseId(purchaseId);
  }
}
