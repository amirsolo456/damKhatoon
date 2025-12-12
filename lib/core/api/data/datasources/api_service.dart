import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();
  factory ApiService() => _singleton;
  ApiService._internal();

  late final Dio dio;

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.damdari.com/api/v1', // یا از .env
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // اینترسپتورها دقیقاً مثل Axios
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(ErrorInterceptor());
    if (true) { // در دیباگ
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
  }
}

// درخواست: اضافه کردن توکن
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

    final message = err.response?.data?['message'] ?? err.message ?? 'خطای ناشناخته';
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      message: message,
    ));
  }
}