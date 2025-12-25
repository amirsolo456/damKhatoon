// مدل وزن‌گیری
import 'package:equatable/equatable.dart';

class WeightRecord extends Equatable {
  final String id;
  final DateTime date;
  final double weight;
  final String? notes;

  const WeightRecord({
    required this.id,
    required this.date,
    required this.weight,
    this.notes,
  });

  @override
  List<Object?> get props => <Object?>[id, date, weight];
}