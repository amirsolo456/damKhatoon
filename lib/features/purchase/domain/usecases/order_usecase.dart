import 'package:khatoon_container/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/features/purchase/data/models/order/order_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';

class GetOrdersByPurchaseIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetOrdersByPurchaseIdUseCase({required this.repository});

  Future<List<OrderModel>> execute(PurchaseInvoiceModel purchase) async {
    return await repository.getOrdersByPurchaseId(purchase.id);
  }
}

class DeleteOrdersByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const DeleteOrdersByIdUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase) async {
    return await repository.deleteOrdersById(purchase.id);
  }
}

class DeleteOrderUseCase {
  final PurchaseRemoteDataSource repository;

  const DeleteOrderUseCase({required this.repository});

  Future<void> execute(OrderModel order) async {
    return await repository.deleteOrder(order);
  }
}

class UpdateOrderUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdateOrderUseCase({required this.repository});

  Future<void> execute(OrderModel order) async {
    return await repository.updateOrder(order);
  }
}

class CreateOrderUseCase {
  final PurchaseRemoteDataSource repository;

  const CreateOrderUseCase({required this.repository});

  Future<void> execute(PurchaseInvoiceModel purchase, OrderModel order) async {
    return await repository.createOrder(purchase, order);
  }
}
