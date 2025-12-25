// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defaults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Defaults _$DefaultsFromJson(Map json) => Defaults(
      cashierId: (json['cashier_id'] as num).toInt(),
      currencyId: (json['currency_id'] as num).toInt(),
      languageId: (json['language_id'] as num).toInt(),
      placeId: (json['place_id'] as num).toInt(),
      yearId: (json['year_id'] as num).toInt(),
    );

Map<String, dynamic> _$DefaultsToJson(Defaults instance) => <String, dynamic>{
      'currency_id': instance.currencyId,
      'cashier_id': instance.cashierId,
      'place_id': instance.placeId,
      'year_id': instance.yearId,
      'language_id': instance.languageId,
    };
