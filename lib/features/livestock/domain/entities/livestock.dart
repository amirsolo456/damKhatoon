import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/animal/domain/entities/animal.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LivestockSummary {
  final String id;
  @JsonKey(name: 'tagNumber')
  final String tagNumber;
  final String? name;
  final AnimalType type;
  final String? breed;
  final String? imageUrl;
  final HealthStatus healthStatus;
  final ReproductionStatus reproductionStatus;
  final DateTime? lastCheckupDate;
  final String? location;

  const LivestockSummary({
    required this.id,
    required this.tagNumber,
    this.name,
    required this.type,
    this.breed,
    this.imageUrl,
    required this.healthStatus,
    required this.reproductionStatus,
    this.lastCheckupDate,
    this.location,
  });

  factory LivestockSummary.fromJson(Map<String, dynamic> json) =>
      _$LivestockSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$LivestockSummaryToJson(this);

  factory LivestockSummary.fromAnimal(Animal animal) {
    return LivestockSummary(
      id: animal.id,
      tagNumber: animal.tagNumber,
      name: animal.name,
      type: animal.type,
      breed: animal.breed,
      imageUrl: animal.imageUrls.isNotEmpty ? animal.imageUrls.first : null,
      healthStatus: animal.healthStatus,
      reproductionStatus: animal.reproductionStatus,
      lastCheckupDate: animal.lastCheckupDate,
      location: animal.location,
    );
  }
}
