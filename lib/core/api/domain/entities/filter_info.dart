import 'package:json_annotation/json_annotation.dart';
part 'filter_info.g.dart';
@JsonSerializable()
class FilterInfo {
  String? colName;
  String? filterType;
  String? value;

  FilterInfo({this.colName,this.filterType,this.value});
  factory FilterInfo.fromJson(Map<String, dynamic> json) =>
      _$FilterInfoFromJson(json);

  Map<String, dynamic> toJson()=>
      _$FilterInfoToJson(this);

}
