// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map json) => Delivery(
      id: (json['id'] as num).toInt(),
      date: (json['date'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      totalWeight: (json['total_weight'] as num).toDouble(),
    );

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'count': instance.count,
      'total_weight': instance.totalWeight,
    };
