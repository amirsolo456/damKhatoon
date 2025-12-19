import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  final int id;
  final String username;
  final String password;
  final String name;
  final int age;
  final String email;
  final int lastLogin;
  final int dataCreated;

  final UserRank rank;

  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.lastLogin,
    required this.dataCreated,
    required this.rank,
    required this.name,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
