// features/purchase/data/models/delivery_model.dart
import '../../domain/entities/delivery.dart';

class DeliveryModel extends Delivery {
  const DeliveryModel({
    required String id,
    required DateTime date,
    required int count,
    required double totalWeight,
  }) : super(
    id: id,
    date: date,
    count: count,
    totalWeight: totalWeight,
  );

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      count: json['count'] as int,
      totalWeight: (json['totalWeight'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'count': count,
      'totalWeight': totalWeight,
    };
  }
}