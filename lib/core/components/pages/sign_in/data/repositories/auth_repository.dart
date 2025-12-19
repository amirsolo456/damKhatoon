/*
import 'package:khatoon_container/core/api/infrastructure/datasources/api_service.dart';
import 'package:khatoon_container/core/components/pages/sign_in/domain/entities/sign_in.dart';
import 'package:khatoon_container/core/components/pages/sign_in/domain/repositories/i_auth_repository.dart';
import 'package:khatoon_container/features/user/domain/entities/user_dto/user.dart';

class AuthRepository extends IAuthRepository {
  final ApiService<SingInResponse,SignIn,SingInRequest > apiService;

  AuthRepository({required this.apiService});

  @override
  Future<User> signIn(SignIn signInData) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<User> signUp(SignIn signInData) async {
    // 1. ارسال SignIn به سرور
    final response = await apiService.get('/auth/signup',(json) => SignIn.fromJson(json) );

    final user = User.fromJson(response.data);
*/
/**//*

    // 3. ذخیره User در دیتابیس محلی
    await userLocalDataSource.saveUser
    (
    user
    );

    return
    user;
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(
      {required String token, required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }


}

// یا اگر سرور فقط id برمی‌گرداند:
// Future<User> signUp(SignIn signInData) async {
//   final response = await apiClient.post('/auth/signup',
//       data: signInData.toJson()
//   );
//
//   // ساخت User با داده‌های SignIn + داده‌های سرور
//   final user = User(
//     id: response.data['id'],
//     username: signInData.username,
//     password: response.data['hashedPassword'] ?? signInData.password,
//     name: signInData.name,
//     age: signInData.age,
//     email: signInData.email,
//     lastLogin: DateTime.now().millisecondsSinceEpoch,
//     dataCreated: DateTime.now().millisecondsSinceEpoch,
//     rank: UserRank.user, // مقدار پیش‌فرض
//   );
//
//   await userLocalDataSource.saveUser(user);
//   return user;
// }
*/
