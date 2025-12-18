import 'package:json_annotation/json_annotation.dart';
part 'order_info.g.dart';

@JsonSerializable()
class OrderInfo {
  String? colName;
  bool? asc;

  OrderInfo({this.colName, this.asc});
  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);

  Map<String, dynamic> toJson()=>
      _$OrderInfoToJson(this);

}
