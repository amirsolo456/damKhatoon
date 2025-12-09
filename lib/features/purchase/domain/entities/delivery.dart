// features/purchase/domain/entities/delivery.dart
import 'package:equatable/equatable.dart';

class Delivery extends Equatable {
  final String id;
  final DateTime date;
  final int count;
  final double totalWeight;

  const Delivery({
    required this.id,
    required this.date,
    required this.count,
    required this.totalWeight,
  });

  @override
  List<Object?> get props => [id, date, count, totalWeight];
}