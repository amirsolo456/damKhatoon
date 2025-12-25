
// lib/core/constants/api_constants.dart
import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = 'https://your-api.com/api';
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;
}

// lib/core/network/dio_client.dart


class DioClient<T,D,C> {
  late Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // افزودن Interceptor برای لاگ کردن درخواست‌ها
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));

    // افزودن Interceptor برای هدرهای احراز هویت (اگر نیاز است)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        // افزودن توکن احراز هویت اگر وجود دارد
        // final token = await GetIt.instance<AuthService>().getToken();
        // if (token != null) {
        //   options.headers['Authorization'] = 'Bearer $token';
        // }
        return handler.next(options);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        // مدیریت خطاهای سراسری
        return handler.next(e);
      },
    ));
  }

  // CowApiService get cowApiService => CowApiServiceImpl(dio: dio);
}