import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/core/api/domain/entities/filter_info.dart';
part 'filters.g.dart';
@JsonSerializable()
class Filters {
  List<FilterInfo>? filterInfo;
  bool? showOnlyBookmarked;
  List<int>? tagIdsFilter;

  Filters({this.filterInfo,this.showOnlyBookmarked,this.tagIdsFilter});

  factory Filters.fromJson(Map<String, dynamic>   fromJsonFilters) =>
      _$FiltersFromJson(fromJsonFilters);

  Map<String, dynamic> toJson()=>
      _$FiltersToJson(this);
}
