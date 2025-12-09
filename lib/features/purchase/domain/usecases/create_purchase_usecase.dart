import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';


class CreatePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePurchaseUseCase({required this.repository});

  Future<PurchaseInvoice> execute(PurchaseInvoice invoice) async{
    return await repository.createPurchase(invoice as PurchaseInvoiceModel);
  }
}