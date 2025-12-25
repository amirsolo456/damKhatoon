// مدل سوابق پزشکی
import 'package:equatable/equatable.dart';

class MedicalRecord extends Equatable {
  final String id;
  final DateTime date;
  final String diagnosis;
  final String symptoms;
  final String treatment;
  final String? medication;
  final double? medicationDosage;
  final String? veterinarian;
  final double? cost;
  final String? notes;
  final bool isResolved;

  const MedicalRecord({
    required this.id,
    required this.date,
    required this.diagnosis,
    required this.symptoms,
    required this.treatment,
    this.medication,
    this.medicationDosage,
    this.veterinarian,
    this.cost,
    this.notes,
    required this.isResolved,
  });

  @override
  List<Object?> get props => <Object?>[id, date, diagnosis];
}