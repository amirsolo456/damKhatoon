// features/purchase/data/models/purchase_item_model.dart
import '../../../domain/entities/purchase_item.dart';

class PurchaseItemModel extends PurchaseItem {
  const PurchaseItemModel({
    required int id,
    required String name,
    required int quantity,
    required double price,
  }) : super(
    id: id,
    name: name,
    quantity: quantity,
    price: price,
  );

  factory PurchaseItemModel.fromJson(Map<String, dynamic> json) {
    return PurchaseItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}