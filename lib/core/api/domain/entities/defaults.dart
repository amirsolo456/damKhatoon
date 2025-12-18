import 'package:json_annotation/json_annotation.dart';
part 'defaults.g.dart';
@JsonSerializable()
class Defaults {
  int currencyId;
  int cashierId;
  int placeId;
  int yearId;
  int languageId;

  Defaults({required this.cashierId,required this.currencyId,required this.languageId,required this.placeId,required this.yearId});

  factory Defaults.fromJson(Map<String, dynamic> json) =>
      _$DefaultsFromJson(json);

  Map<String, dynamic> toJson()=>
      _$DefaultsToJson(this);
}
