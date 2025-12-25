// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livestock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivestockSummary _$LivestockSummaryFromJson(Map json) => LivestockSummary(
      id: json['id'] as String,
      tagNumber: json['tagNumber'] as String,
      name: json['name'] as String?,
      type: $enumDecode(_$AnimalTypeEnumMap, json['type']),
      breed: json['breed'] as String?,
      imageUrl: json['image_url'] as String?,
      healthStatus: $enumDecode(_$HealthStatusEnumMap, json['health_status']),
      reproductionStatus:
          $enumDecode(_$ReproductionStatusEnumMap, json['reproduction_status']),
      lastCheckupDate: (json['last_checkup_date'] as num?)?.toInt(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$LivestockSummaryToJson(LivestockSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tagNumber': instance.tagNumber,
      'name': instance.name,
      'type': _$AnimalTypeEnumMap[instance.type]!,
      'breed': instance.breed,
      'image_url': instance.imageUrl,
      'health_status': _$HealthStatusEnumMap[instance.healthStatus]!,
      'reproduction_status':
          _$ReproductionStatusEnumMap[instance.reproductionStatus]!,
      'last_checkup_date': instance.lastCheckupDate,
      'location': instance.location,
    };

const _$AnimalTypeEnumMap = {
  AnimalType.cow: 'cow',
  AnimalType.sheep: 'sheep',
  AnimalType.goat: 'goat',
  AnimalType.buffalo: 'buffalo',
  AnimalType.camel: 'camel',
  AnimalType.horse: 'horse',
  AnimalType.donkey: 'donkey',
  AnimalType.poultry: 'poultry',
  AnimalType.fish: 'fish',
  AnimalType.other: 'other',
};

const _$HealthStatusEnumMap = {
  HealthStatus.healthy: 'healthy',
  HealthStatus.sick: 'sick',
  HealthStatus.injured: 'injured',
  HealthStatus.quarantined: 'quarantined',
  HealthStatus.dead: 'dead',
  HealthStatus.sold: 'sold',
};

const _$ReproductionStatusEnumMap = {
  ReproductionStatus.notPregnant: 'notPregnant',
  ReproductionStatus.pregnant: 'pregnant',
  ReproductionStatus.inHeat: 'inHeat',
  ReproductionStatus.nursing: 'nursing',
  ReproductionStatus.dry: 'dry',
};
