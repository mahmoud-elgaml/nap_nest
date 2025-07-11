import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://laravel-api-ageaa7exbtgqauh2.ukwest-01.azurewebsites.net/api/',
      // baseUrl: 'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/',
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      followRedirects: false,
      validateStatus: (status) => status != null && status < 500,
    ),
  );
}
