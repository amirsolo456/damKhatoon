import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/user/domain/entities/user_dto/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends HiveObject{
  Id id = Isar.autoIncrement;
  @HiveField(0)
  late String? username;
  @HiveField(1)
  late String? password;
  @HiveField(2)
  late String? email;
  late int? lastLogin;
  late int? dataCreated;
  @enumerated
  late UserRank rank;
  String? name;
  int? age;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // تبدیل از Entity
  UserModel.fromEntity(User user) {
    id = user.id;
    username = user.username;
    password = user.password;
    email = user.email;
    lastLogin = user.lastLogin;
    dataCreated = user.dataCreated;
    rank = user.rank;
    name = user.name;
    age = user.age;
  }

  User toEntity() {
    return User(
      id: id,
      username: username ?? '',
      password: password ?? '',
      email: email ?? '',
      lastLogin: lastLogin ?? 0,
      dataCreated: dataCreated ?? 0,
      rank: rank,
      name: name ?? '',
      age: age ?? 12,
    );
  }
}
