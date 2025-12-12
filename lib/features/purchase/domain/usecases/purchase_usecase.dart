import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/data/repositories/purchase_repository_impl.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';

class CreatePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePurchaseUseCase({required this.repository});

  Future<PurchaseInvoice> execute(PurchaseInvoiceModel invoice) async {
    return await repository.createPurchase(invoice);
  }
}

class GetPurchasesUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPurchasesUseCase({required this.repository});

  Future<List<PurchaseInvoiceModel>> execute() async {
    return await repository.getPurchases();
  }
}

class GetPurchasesByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPurchasesByIdUseCase({required this.repository});

  Future<List<PurchaseInvoiceModel>> execute(int purchasesId) async {
    return await repository.getPurchases();
  }
}

class DeletePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePurchaseUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase) async {
    return await repository.deletePurchase(purchase);
  }
}

class UpdatePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdatePurchaseUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase) {
    return repository.updatePurchase(purchase);
  }
}
