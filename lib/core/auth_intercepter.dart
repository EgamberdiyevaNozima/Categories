import 'package:dio/dio.dart';
import 'package:profile/core/token_storage.dart';  // TokenStorage yordamida tokenni olish

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Tokenni olish
    String? token = await TokenStorage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';  // So'rovga tokenni qo'shish
    }

    super.onRequest(options, handler);
  }
}
