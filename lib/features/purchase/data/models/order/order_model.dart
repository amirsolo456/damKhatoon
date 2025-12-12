import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/order.dart';
part 'order_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.itemId,
    required super.userId,
    required super.quantity,
    required super.price,
    required super.userRank,
    required super.date,
  }) : super(totalWeight: 0);


  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}
