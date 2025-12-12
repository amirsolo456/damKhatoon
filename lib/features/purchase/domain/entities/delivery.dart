import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';


part 'delivery.g.dart';


@JsonSerializable(fieldRename: FieldRename.pascal)
class Delivery extends Equatable {
  final int id;
  @JsonKey(toJson: _toJson, fromJson: _fromJson)
  final DateTime date;
  final int count;
  final double totalWeight;

  const Delivery({
    required this.id,
    required this.date,
    required this.count,
    required this.totalWeight,
  });

  static int _toJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _fromJson(dynamic value) {
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    } else if (value is String) {
      return DateTime.parse(value);
    }
    return DateTime.now();
  }

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);
  @override
  List<Object?> get props => [id, date, count, totalWeight];
}