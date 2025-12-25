// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterInfo _$FilterInfoFromJson(Map json) => FilterInfo(
      colName: json['col_name'] as String?,
      filterType: json['filter_type'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FilterInfoToJson(FilterInfo instance) =>
    <String, dynamic>{
      'col_name': instance.colName,
      'filter_type': instance.filterType,
      'value': instance.value,
    };
