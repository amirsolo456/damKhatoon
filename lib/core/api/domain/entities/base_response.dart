import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';
@JsonSerializable()
class BaseResponse<D> extends Equatable {
  List<D>? data;
  int? status;
  String? message;

  BaseResponse({this.status,this.data,this.message});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      D Function(Object? json) fromJsonD,
      ) => _$BaseResponseFromJson(json,fromJsonD);

  Map<String, dynamic> toJson(
      Map<String, dynamic>? Function(D value) toJsonD,
      ) => _$BaseResponseToJson(this, toJsonD);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
