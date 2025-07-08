import 'package:dio/dio.dart';
import 'package:nap_nest/features/auth/data/models/patient_model.dart';

// Future<PatientModel?> register({
//   required String name,
//   required String birthDate,
//   required String gender,
//   required String email,
//   required String password,
//   required String confirmPassword,
// }) async {
//   try {
//     final response = await _dio.post(
//       'register',
//       data: {
//         'patient_name': name,
//         'birth_date': birthDate,
//         'gender': gender,
//         'email': email,
//         'password': password,
//         'password_confirmation': confirmPassword,
//       },
//     );

//     print('📥 Status Code: ${response.statusCode}');
//     print('📥 Response Data: ${response.data}');
//     if ((response.statusCode == 200 || response.statusCode == 201) &&
//         response.data['patient'] != null) {
//       return PatientModel.fromJson(response.data['patient']);
//     } else {
//       print('❌No patient found in response.');
//       return null;
//     }
//   } on DioException catch (e) {
//     print('❌DioException caught: ${e.response?.data}');
//     String errorMessage = 'Something went wrong';

//     if (e.response != null && e.response?.data != null) {
//       final data = e.response!.data;

//       if (data is Map<String, dynamic>) {
//         if (data.containsKey('message')) {
//           errorMessage = data['message'];
//         } else if (data.containsKey('errors')) {
//           final firstError = (data['errors'] as Map).values.first;
//           if (firstError is List && firstError.isNotEmpty) {
//             errorMessage = firstError[0];
//           }
//         }
//       }
//     }

//     throw Exception(errorMessage);
//   }
// }

// Future<String> login({required String email, required String password}) async {
//   try {
//     final response = await _dio.post('login', data: {'email': email, 'password': password});

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final token = response.data['token'];
//       return token; // ✅ الآن صح، لأن الدالة Future<String>
//     } else {
//       throw Exception('Login failed.');
//     }
//   } on DioException catch (e) {
//     final msg = e.response?.data['message'] ?? 'Login error';
//     throw Exception(msg);
//   }
// }

import 'package:nap_nest/services/api/api_service.dart';

class AuthApi {
  final Dio _dio = APIService.dio;

  Future<PatientModel?> register({
    required String name,
    required String birthDate,
    required String gender,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post(
        'register',
        data: {
          'patient_name': name,
          'birth_date': birthDate,
          'gender': gender,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      print('📥 Status Code: ${response.statusCode}');
      print('📥 Response Data: ${response.data}');
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data['patient'] != null) {
        return PatientModel.fromJson(response.data['patient']);
      } else {
        print('❌No patient found in response.');
        return null;
      }
    } on DioException catch (e) {
      print('❌DioException caught: ${e.response?.data}');
      throw Exception(_extractErrorMessage(e));
    }
  }

  Future<String> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('login', data: {'email': email, 'password': password});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['token'];
      } else {
        throw Exception('Login failed.');
      }
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  String _extractErrorMessage(DioException e) {
    String errorMessage = 'Something went wrong';
    final data = e.response?.data;

    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) {
        errorMessage = data['message'];
      } else if (data.containsKey('errors')) {
        final firstError = (data['errors'] as Map).values.first;
        if (firstError is List && firstError.isNotEmpty) {
          errorMessage = firstError[0];
        }
      }
    }
    return errorMessage;
  }
}
