// core/error/failures.dart
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'خطا در ارتباط با سرور']) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'خطا در ذخیره‌سازی محلی']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'خطا در اتصال به اینترنت']) : super(message);
}