// features/purchase/data/models/delivery_model.dart
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/delivery.dart';

part 'delivery_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class DeliveryModel extends Delivery {
  const DeliveryModel({
    @JsonKey(toJson: _toJson, fromJson: _fromJson) required DateTime date,
    required int count,
    required int id,
    required double totalWeight,
  }) : super(id: id, date: date, count: count, totalWeight: totalWeight);

  static int _toJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _fromJson(int value) =>
      DateTime.fromMillisecondsSinceEpoch(value);

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryModelToJson(this);
}
