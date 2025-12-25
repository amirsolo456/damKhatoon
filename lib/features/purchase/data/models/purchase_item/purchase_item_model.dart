<<<<<<< HEAD
// features/purchase/data/models/purchase_item_model.dart
import 'package:khatoon_container/features/purchase/domain/entities/purchase_item.dart';

class PurchaseItemModel extends PurchaseItem {
  const PurchaseItemModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.price,
  });
=======
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/purchase_item.dart';
part 'purchase_item_model.g.dart';
@JsonSerializable()
class PurchaseItemModel extends PurchaseItem {
  const PurchaseItemModel({
    required int id,
    required String name,
    required int quantity,
    required double price,
  }) : super(id: id, name: name, quantity: quantity, price: price);
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0

  factory PurchaseItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemModelFromJson(json);

<<<<<<< HEAD
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}
=======
  Map<String, dynamic> toJson() => _$PurchaseItemModelToJson(this);
}
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0
