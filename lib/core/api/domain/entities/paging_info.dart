import 'package:json_annotation/json_annotation.dart';
part 'paging_info.g.dart';
@JsonSerializable()
class PagingInfo {
  bool? onlyTotalCount;
  int? pageRecordCount;
  int? pageNumber;
  int? startIndex;
  bool? withTotalCount;
  int? totalRowCount;

  PagingInfo({
    this.onlyTotalCount,
    this.pageNumber,
    this.pageRecordCount,
    this.startIndex,
    this.totalRowCount,
    this.withTotalCount,
  });

  factory PagingInfo.fromJson(Map<String, dynamic>   fromJsonPagingInfo) =>
      _$PagingInfoFromJson(fromJsonPagingInfo);

  Map<String, dynamic> toJson()=>
      _$PagingInfoToJson(this);
}
