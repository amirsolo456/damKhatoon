// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filters _$FiltersFromJson(Map json) => Filters(
      filterInfo: (json['filter_info'] as List<dynamic>?)
          ?.map((e) => FilterInfo.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      showOnlyBookmarked: json['show_only_bookmarked'] as bool?,
      tagIdsFilter: (json['tag_ids_filter'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'filter_info': instance.filterInfo?.map((e) => e.toJson()).toList(),
      'show_only_bookmarked': instance.showOnlyBookmarked,
      'tag_ids_filter': instance.tagIdsFilter,
    };
