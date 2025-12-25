// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<D> _$BaseResponseFromJson<D>(
  Map json,
  D Function(Object? json) fromJsonD,
) =>
    BaseResponse<D>(
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)?.map(fromJsonD).toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson<D>(
  BaseResponse<D> instance,
  Object? Function(D value) toJsonD,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonD).toList(),
      'status': instance.status,
      'message': instance.message,
    };
