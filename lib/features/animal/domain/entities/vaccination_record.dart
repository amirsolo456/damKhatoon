// مدل واکسیناسیون
import 'package:equatable/equatable.dart';

class VaccinationRecord extends Equatable {
  final String id;
  final String vaccineName;
  final String disease;
  final DateTime date;
  final double dosage;
  final String? batchNumber;
  final String? manufacturer;
  final String? administeredBy;
  final int nextVaccinationDays;
  final DateTime? nextVaccinationDate;
  final String? notes;

  const VaccinationRecord({
    required this.id,
    required this.vaccineName,
    required this.disease,
    required this.date,
    required this.dosage,
    this.batchNumber,
    this.manufacturer,
    this.administeredBy,
    required this.nextVaccinationDays,
    this.nextVaccinationDate,
    this.notes,
  });

  @override
  List<Object?> get props => <Object?>[id, vaccineName, date];
}