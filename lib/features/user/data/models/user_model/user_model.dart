import 'package:isar/isar.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/user/domain/entities/user_dto/user.dart';

part 'user_model.g.dart';

@Collection()
class UserModel {
  Id id = Isar.autoIncrement;

  late String? username;
  late String? password;
  late String? email;
  late int? lastLogin;
  late int? dataCreated;
  @enumerated
  late UserRank rank;
  String? name;
  int? age;

  UserModel();

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
