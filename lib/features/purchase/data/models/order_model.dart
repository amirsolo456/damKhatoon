import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/order.dart' ;
import 'package:decimal/decimal.dart';

part 'order.dart';

@JsonSerializable()
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

  // factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModel(json);

  // factory OrderModel.fromJson(Map<String, dynamic> json) {
  //   return OrderModel(
  //     id: json['id'] as int,
  //     quantity: json['quantity'] as int,
  //     price: (json['price'] as Decimal),
  //     itemId:  json['quantity'] as int,
  //     userId:  json['quantity'] as int,
  //     userRank:  json['quantity'] as int,
  //     date:  json['date'] as int,
  //     weight:  json['quantity'] as int,
  //   );
  // }
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
