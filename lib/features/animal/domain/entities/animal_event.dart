// مدل رویدادها (Events)
import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';

class AnimalEvent extends Equatable {
  final String id;
  final DateTime date;
  final EventType type;
  final String description;
  final String? notes;
  final String? performedBy;

  const AnimalEvent({
    required this.id,
    required this.date,
    required this.type,
    required this.description,
    this.notes,
    this.performedBy,
  });

  @override
  List<Object?> get props => [id, date, type];
}