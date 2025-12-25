// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryModel _$DeliveryModelFromJson(Map json) => DeliveryModel(
      date: (json['date'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      totalWeight: (json['total_weight'] as num).toDouble(),
    );

Map<String, dynamic> _$DeliveryModelToJson(DeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'count': instance.count,
      'total_weight': instance.totalWeight,
    };
