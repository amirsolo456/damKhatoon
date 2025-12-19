

abstract class IAuthRepository {
  Future<void> verifyPhonNumber(String token);      // تأیید ایمیل با توکن
  Future<void> resendVerificationPhonNumber( );   // ارسال مجدد ایمیل تأیید

}