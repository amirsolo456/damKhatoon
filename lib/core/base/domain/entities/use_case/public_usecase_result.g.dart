// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_usecase_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicUseCaseResult<T> _$PublicUseCaseResultFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    PublicUseCaseResult<T>(
      state: $enumDecode(_$UsecaseStateEnumMap, json['state']),
      message: json['message'] as String?,
      error: json['error'] == null
          ? null
          : SerializableError.fromJson(
              Map<String, dynamic>.from(json['error'] as Map)),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$PublicUseCaseResultToJson<T>(
  PublicUseCaseResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'state': _$UsecaseStateEnumMap[instance.state]!,
      'message': instance.message,
      'error': instance.error?.toJson(),
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

const _$UsecaseStateEnumMap = {
  UsecaseState.success: 'success',
  UsecaseState.failure: 'failure',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
