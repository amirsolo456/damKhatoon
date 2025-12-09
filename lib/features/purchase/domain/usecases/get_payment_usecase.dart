import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/payment_model.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';

class GetPaymentsByInvoiceUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPaymentsByInvoiceUseCase({required this.repository});

  Future<List<PaymentModel>> execute(PurchaseInvoice invoice) async {
    return await repository.getPaymentsByPurchaseId(invoice.id);
  }
}
