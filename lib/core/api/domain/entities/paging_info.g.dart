// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingInfo _$PagingInfoFromJson(Map json) => PagingInfo(
      onlyTotalCount: json['only_total_count'] as bool?,
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageRecordCount: (json['page_record_count'] as num?)?.toInt(),
      startIndex: (json['start_index'] as num?)?.toInt(),
      totalRowCount: (json['total_row_count'] as num?)?.toInt(),
      withTotalCount: json['with_total_count'] as bool?,
    );

Map<String, dynamic> _$PagingInfoToJson(PagingInfo instance) =>
    <String, dynamic>{
      'only_total_count': instance.onlyTotalCount,
      'page_record_count': instance.pageRecordCount,
      'page_number': instance.pageNumber,
      'start_index': instance.startIndex,
      'with_total_count': instance.withTotalCount,
      'total_row_count': instance.totalRowCount,
    };
