import 'package:isar/isar.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/features/user/domain/repositories/i_user_repository.dart';

class UserLocalDataSource implements IUserRepository {
  final Isar isar;

  UserLocalDataSource(this.isar);

  Future<void> addUser(UserModel userModel) async {
    await isar.writeTxn(() async {
      await isar.userModels.put(userModel);
    });
  }

  Future<List<UserModel>> getAllUsers() async {
    return await isar.userModels.where().findAll();
  }

  Future<UserModel?> getUserById(int id) async {
    return await isar.userModels.get(id);
  }
}
