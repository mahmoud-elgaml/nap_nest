import 'package:dio/dio.dart';

// class APIService {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/',
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         //
//       },
//       followRedirects: false,
//       validateStatus: (status) => status != null && status < 500,
//     ),
//   );
// }



class APIService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/',
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      followRedirects: false,
      validateStatus: (status) => status != null && status < 500,
    ),
  );
}
