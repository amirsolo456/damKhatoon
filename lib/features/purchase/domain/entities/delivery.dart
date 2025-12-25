import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';


part 'delivery.g.dart';


@JsonSerializable()
class Delivery extends Equatable {
  final int id;
  final int date;
  final int count;
  final double totalWeight;

  const Delivery({
    required this.id,
    required this.date,
    required this.count,
    required this.totalWeight,
  });

  static int _toJson(int value) => value ;

  static int _fromJson(int value) {
    // if (value is int) {
    //   return DateTime.fromMillisecondsSinceEpoch(value);
    // } else if (value is String) {
    //   return DateTime.parse(value);
    // }
    return value;
  }

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

  @override
  List<Object?> get props => <Object?>[id, date, count, totalWeight];
}