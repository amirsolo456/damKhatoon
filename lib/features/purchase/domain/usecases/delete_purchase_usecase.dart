import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice_model.dart';

import '../entities/purchase_invoice.dart';
import '../repositories/purchase_repository.dart';

class DeletePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePurchaseUseCase({required this.repository});

  Future<void> execute(PurchaseInvoice invoice) async {
    return await repository.deletePurchase(invoice.id.toString());
  }
}
