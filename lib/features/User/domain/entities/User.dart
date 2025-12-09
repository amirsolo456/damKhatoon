import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  final int id;
  @JsonLiteral('UserName',asConst: false)
  @JsonSerializable(fieldRename: FieldRename.snake)
  final String username;

  final String password;
  final String email;
  final DateTime lastLogin;
  final DateTime dataCreated;
  final UserRank rank;

  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.lastLogin,
    required this.dataCreated,
    required this.rank,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
