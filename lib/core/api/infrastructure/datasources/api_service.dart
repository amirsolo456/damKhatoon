import 'package:dio/dio.dart';
import 'package:khatoon_container/core/api/domain/entities/base_request.dart';
import 'package:khatoon_container/core/api/domain/entities/base_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

abstract class IApiService<T extends BaseResponse<D>, D, C extends BaseRequest> {
  Future<T> get(String path, {Map<String, dynamic>? queryParameters, required T Function(Map<String, dynamic>) fromJson});
  Future<T> post(String path, {C? data, required T Function(Map<String, dynamic>) fromJson});
  Future<T> put(String path, {C? data, required T Function(Map<String, dynamic>) fromJson});
  Future<T> delete(String path, {Map<String, dynamic>? queryParameters, required T Function(Map<String, dynamic>) fromJson});
  Future<String> refreshToken(); // تمدید توکن دسترسی
  Future<bool> validateToken(); // بررسی اعتبار توکن
}

class ApiService<T extends BaseResponse<D>, D, C extends BaseRequest> implements IApiService<T, D, C> {
  static final ApiService _singleton = ApiService._internal();
  // factory ApiService() => _singleton;
  ApiService._internal();

  late final Dio dio;

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.damdari.com/api/v1',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(ErrorInterceptor());
    if (true) { // در دیباگ
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
  }

  @override
  Future<T> get(String path, {Map<String, dynamic>? queryParameters, required T Function(Map<String, dynamic>) fromJson}) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    return fromJson(response.data);
  }

  @override
  Future<T> post(String path, {C? data, required T Function(Map<String, dynamic>) fromJson}) async {
    final response = await dio.post(path, data: data?.toJson());
    return fromJson(response.data);
  }

  @override
  Future<T> put(String path, {C? data, required T Function(Map<String, dynamic>) fromJson}) async {
    final response = await dio.put(path, data: data?.toJson());
    return fromJson(response.data);
  }

  @override
  Future<T> delete(String path, {Map<String, dynamic>? queryParameters, required T Function(Map<String, dynamic>) fromJson}) async {
    final response = await dio.delete(path, queryParameters: queryParameters);
    return fromJson(response.data);
  }

  // متد send که می‌تواند برای درخواست‌های سفارشی استفاده شود
  Future<T> send({
    required String method,
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method),
    );
    return fromJson(response.data);
  }

  @override
  Future<String> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> validateToken() {
    // TODO: implement validateToken
    throw UnimplementedError();
  }
}

// اینترسپتورها مانند قبل
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      // اگر از route management استفاده می‌کنید، اینجا می‌توانید هدایت به صفحه لاگین را انجام دهید.
    }

    final message = err.response?.data?['message'] ?? err.message ?? 'خطای ناشناخته';
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      message: message,
    ));
  }
}

/*
// درخواست: اضافه کردن توکن
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

// پاسخ: مدیریت 401 و ارور عمومی
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // لاگ‌اوت خودکار
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      // برو به صفحه لاگین (مثلاً با GoRouter یا Navigator)
      // navigatorKey.currentState?.pushNamed('/login');
    }

    final message = err.response?.data?['message'] ?? err.message ??
        'خطای ناشناخته';
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      message: message,
    ));
  }
}*/
