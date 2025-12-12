// features/user/domain/use_cases/get_users_usecase.dart
import 'package:khatoon_container/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/features/user/data/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserModel>> call() async {
    return await repository.getUsers();
  }
}

class SaveUserUseCase {
  final UserRepository repository;

  SaveUserUseCase(this.repository);

  Future<void> call(UserModel user) async {
    return await repository.saveUser(user);
  }
}