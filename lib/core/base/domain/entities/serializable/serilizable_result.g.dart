// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serilizable_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableError _$SerializableErrorFromJson(Map json) => SerializableError(
      message: json['message'] as String,
      stackTrace: json['stack_trace'] as String?,
    );

Map<String, dynamic> _$SerializableErrorToJson(SerializableError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'stack_trace': instance.stackTrace,
    };
