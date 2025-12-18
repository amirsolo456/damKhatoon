import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/features/user/domain/entities/user_dto/user.dart';



abstract class IUserRepository {
  Future<void> addUser(UserModel userModel);
  Future<List<UserModel>> getAllUsers();
  Future<UserModel?> getUserById(int id);
  Future<void> updateUser(UserModel userModel);
  Future<void> deleteUser(int id);
  Future<void> clearAllUsers();
}
