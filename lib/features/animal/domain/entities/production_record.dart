// مدل تولید مثل
import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';

class ReproductionRecord extends Equatable {
  final String id;
  final DateTime date;
  final ReproductionType type;
  final String? mateId;
  final String? method;
  final DateTime? expectedBirthDate;
  final DateTime? actualBirthDate;
  final int? numberOfOffspring;
  final List<String>? offspringIds;
  final String? notes;

  const ReproductionRecord({
    required this.id,
    required this.date,
    required this.type,
    this.mateId,
    this.method,
    this.expectedBirthDate,
    this.actualBirthDate,
    this.numberOfOffspring,
    this.offspringIds,
    this.notes,
  });

  @override
  List<Object?> get props => <Object?>[id, date, type];
}