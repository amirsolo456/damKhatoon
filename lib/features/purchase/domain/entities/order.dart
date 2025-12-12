// features/purchase/domain/entities/delivery.dart
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
part 'order.g.dart';
@JsonSerializable()
class Order extends Equatable {
  @JsonKey(name: 'ID')
  final int id;
  final int itemId;
  final int userId;
  final UserRank userRank;
  final DateTime date;
  final int quantity;
  final Decimal price;
  final double totalWeight;

  const Order({
    required this.id,
    required this.date,
    required this.quantity,
    required this.totalWeight,
    required this.itemId,
    required this.userId,
    required this.userRank,
    required this.price,
  });

  @override
  List<Object?> get props => [id, date, quantity, totalWeight];
}
