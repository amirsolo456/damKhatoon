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

  factory PurchaseItemModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseItemModelToJson(this);
}
