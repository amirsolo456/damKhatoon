import 'package:json_annotation/json_annotation.dart';

part 'serilizable_result.g.dart';

@JsonSerializable()
class SerializableError {
  final String message;
  final String? stackTrace;

  SerializableError({required this.message, this.stackTrace});

  factory SerializableError.fromJson(Map<String, dynamic> json) =>
      _$SerializableErrorFromJson(json);

  Map<String, dynamic> toJson() => _$SerializableErrorToJson(this);
}
