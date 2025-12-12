import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';

class GetPaymentsByInvoiceIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPaymentsByInvoiceIdUseCase({required this.repository});

  Future<List<PaymentModel>> execute(PurchaseInvoiceModel invoice) async {
    return await repository.getPaymentsByPurchaseId(invoice.id);
  }
}

class DeletePaymentsByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePaymentsByIdUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase) async {
    return await repository.deletePaymentsById(purchase.id);
  }
}

class DeletePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePaymentUseCase({required this.repository});

  Future<void> execute(PaymentModel payment) async {
    return await repository.deletePayment(payment);
  }
}

class UpdatePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdatePaymentUseCase({required this.repository});

  Future<void> execute(PaymentModel payment) async {
    return await repository.updatePayment(payment);
  }
}


class CreatePaymentUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePaymentUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase ,PaymentModel payment) async {
    return await repository.createPayment(purchase,payment);
  }
}

class CreatePaymentsUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePaymentsUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase ,List<PaymentModel> payment) async {
    return await repository.createPayments(purchase,payment);
  }
}

