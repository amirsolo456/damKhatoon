// مدل تولید مثل
import 'package:equatable/equatable.dart';

class AnimalStrip extends Equatable {
  final int id;
  final DateTime date;
  final String? description;
  final String? name;

  const AnimalStrip({
    required this.id,
    required this.date,
    this.description,
    this.name,
  });

  @override
  List<Object?> get props => <Object?>[id, date, date, description, name];
}
