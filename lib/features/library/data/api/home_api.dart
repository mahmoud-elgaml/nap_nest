import 'package:dio/dio.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
class HomeApiService {
  static final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://laravel-api-ageaa7exbtgqauh2.ukwest-01.azurewebsites.net/api/',
        connectTimeout: const Duration(seconds: 1000),
        receiveTimeout: const Duration(seconds: 1000),
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = Prefs.getString('token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            options.headers['Accept'] = 'application/json';
            print('✅ Interceptor added token');
          } else {
            print('⚠️ No token found in interceptor');
          }
          return handler.next(options);
        },
      ),
    );
}
