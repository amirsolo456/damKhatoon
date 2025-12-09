import '../entities/purchase_invoice.dart';
import '../repositories/purchase_repository.dart';

class AddPurchasesUseCase {
  final AddPurchasesUseCase repository;

  // استفاده از constructor با پارامتر required
  const AddPurchasesUseCase({required this.repository});

  Future<List<PurchaseInvoice>> execute() {
    return repository.execute();
  }
}