import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';


class GetAllPurchasesUseCase {
  final PurchaseRemoteDataSource repository;

  const GetAllPurchasesUseCase({required this.repository});

  Future<List<PurchaseInvoiceModel>> execute() async {
    return await repository.getPurchases();
  }
}

class GetAllPurchasesByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetAllPurchasesByIdUseCase({required this.repository});

  Future<List<PurchaseInvoiceModel>> execute(String purchasesId) async {
    return await repository.getPurchases();
  }
}

