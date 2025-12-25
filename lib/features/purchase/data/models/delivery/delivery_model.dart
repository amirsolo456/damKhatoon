import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/delivery.dart';

part 'delivery_model.g.dart';

@JsonSerializable()
class DeliveryModel extends Delivery {
  const DeliveryModel({
    required super.date,
    required super.count,
    required super.id,
    required super.totalWeight,
  });

  static int dateToJson(int value) => value;

  static int dateFromJson(int value) => value;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeliveryModelToJson(this);
}
