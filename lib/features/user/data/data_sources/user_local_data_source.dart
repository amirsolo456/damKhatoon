import 'package:hive/hive.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/features/user/domain/repositories/i_user_repository.dart';

part 'user_local_data_source.g.dart';

@HiveType(typeId: 0)
class UserLocalDataSource implements IUserRepository {
  static const String _boxName = 'usersBox';
  static Box<UserModel> box = Hive.box<UserModel>(_boxName);

  @override
  Future<void> addUser(UserModel userModel) async {
    await box.put(_boxName, userModel);
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    return box.values.toList();
  }

  @override
  Future<UserModel?> getUserById(int id) async {
    return box.values.firstWhere(
      (UserModel user) => user.id == id,
      orElse: () => UserModel(),
    );
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    await box.put(userModel.id, userModel);
  }

  @override
  Future<void> deleteUser(int id) async {
    await box.delete(id);
  }

  @override
  Future<void> clearAllUsers() async {
    await box.clear();
  }

  Future<UserModel?> getUserByIdOptimized(int id) async {
    final int index = box.values.toList().indexWhere((UserModel user) => user.id == id);
    return index != -1 ? box.getAt(index) : null;
  }
}
