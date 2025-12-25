// مدل شیردوشی (برای دام‌های شیری)
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MilkingRecord extends Equatable {
  final String id;
  final DateTime date;
  final TimeOfDay time;
  final double amount;
  final double? fatPercentage;
  final double? proteinPercentage;
  final double? temperature;
  final String? notes;

  const MilkingRecord({
    required this.id,
    required this.date,
    required this.time,
    required this.amount,
    this.fatPercentage,
    this.proteinPercentage,
    this.temperature,
    this.notes,
  });

  @override
  List<Object?> get props => <Object?>[id, date, time];
}
