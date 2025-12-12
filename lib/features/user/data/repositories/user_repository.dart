// features/user/data/repositories/user_repository.dart
import 'package:khatoon_container/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';

class UserRepository {
  final UserLocalDataSource localDataSource;
  // اگر API دارید
  // final UserRemoteDataSource remoteDataSource;

  UserRepository(this.localDataSource);

  Future<void> saveUser(UserModel user) async {
    return await localDataSource.addUser(user);
  }

  Future<List<UserModel>> getUsers() async {
    return await localDataSource.getAllUsers();
  }

  Future<UserModel?> getUser(int id) async {
    return await localDataSource.getUserById(id);
  }
}