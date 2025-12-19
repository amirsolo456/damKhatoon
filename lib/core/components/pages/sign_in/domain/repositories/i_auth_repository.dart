/*
import 'package:khatoon_container/core/components/pages/sign_in/domain/entities/response_data.dart';
import 'package:khatoon_container/features/user/domain/entities/user_dto/user.dart';

abstract class IAuthRepository {
  // === ضروریات ===
  Future<User> signUp(ResponseData signInData);
  Future<User> signIn(ResponseData signInData);
  Future<void> signOut();

  // === مدیریت کاربر جاری ===
  Future<User?> getCurrentUser();
  Future<void> saveUser(User user);
  Future<void> deleteUser();
  Future<bool> isUserLoggedIn();

  // === بازیابی رمز عبور ===
  Future<void> forgotPassword(String email);
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });
}*/
