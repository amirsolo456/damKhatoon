import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';

part 'livestock.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
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
  @JsonKey(toJson: _toJson, fromJson: _fromJson)
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
  static int _toJson(DateTime? value) => (value != null ? value.millisecondsSinceEpoch : DateTime.now().toUtc().millisecond);

  static DateTime? _fromJson(int? value) =>
      DateTime.fromMillisecondsSinceEpoch(value ?? 0);

  factory LivestockSummary.fromJson(Map<String, dynamic> json) =>
      _$LivestockSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$LivestockSummaryToJson(this);
  // factory LivestockSummary.fromJson(Map<String, dynamic> json) =>
  //     _$LivestockSummaryFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$LivestockSummaryToJson(this);

  // factory LivestockSummary.fromAnimal(Animal animal) {
  //   return LivestockSummary(
  //     id: animal.id,
  //     tagNumber: animal.tagNumber,
  //     name: animal.name,
  //     type: animal.type,
  //     breed: animal.breed,
  //     imageUrl: animal.imageUrls.isNotEmpty ? animal.imageUrls.first : null,
  //     healthStatus: animal.healthStatus,
  //     reproductionStatus: animal.reproductionStatus,
  //     lastCheckupDate: animal.lastCheckupDate,
  //     location: animal.location,
  //   );
  // }
}
