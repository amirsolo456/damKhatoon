// مدل تغذیه
import 'package:equatable/equatable.dart';

class FeedRecord extends Equatable {
  final String id;
  final DateTime date;
  final String feedType;
  final double amount;
  final String? unit;
  final String? supplier;
  final double? unitPrice;
  final String? notes;

  const FeedRecord({
    required this.id,
    required this.date,
    required this.feedType,
    required this.amount,
    this.unit,
    this.supplier,
    this.unitPrice,
    this.notes,
  });

  double get totalCost => amount * (unitPrice ?? 0);

  @override
  List<Object?> get props => <Object?>[id, date, feedType];
}