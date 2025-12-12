import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import '../entities/purchase_invoice.dart';

class GetDeliveryByPurchaseIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetDeliveryByPurchaseIdUseCase({required this.repository});

  Future<List<DeliveryModel>> execute(PurchaseInvoiceModel invoice) async {
    return await repository.getDeliveriesByPurchaseId(invoice.id);
  }
}

class DeleteDeliveriesByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const DeleteDeliveriesByIdUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel invoice) async {
    return await repository.deleteDeliveriesById(invoice.id);
  }
}

class DeleteDeliveryUseCase {
  final PurchaseRemoteDataSource repository;

  const DeleteDeliveryUseCase({required this.repository});

  Future<void> execute(DeliveryModel delivery) async {
    return await repository.deleteDelivery(delivery);
  }
}

class CreateDeliveryUseCase {
  final PurchaseRemoteDataSource repository;

  const CreateDeliveryUseCase({required this.repository});

  Future<void> execute(
    PurchaseInvoiceModel purchase,
    DeliveryModel delivery,
  ) async {
    return await repository.createDelivery(purchase, delivery);
  }
}



class UpdateDeliveryUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdateDeliveryUseCase({required this.repository});

  Future<void> execute(DeliveryModel delivery) async {
    return await repository.updateDelivery(delivery);
  }
}
