import 'package:nap_nest/features/auth/data/models/patient_model.dart';
import 'package:dio/dio.dart';
import 'package:nap_nest/services/api/api_service.dart';
class AuthService {
  final Dio _dio = ApiService.dio;

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
        throw Exception(response.data['message'] ?? 'Registration failed.');
      }
    } on DioException catch (e) {
      print('❌ DioException caught');
      print('👉 Type: ${e.type}');
      print('👉 Message: ${e.message}');
      print('👉 Response: ${e.response}');

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
      } else if (e.message != null) {
        errorMessage = e.message!;
      }

      throw Exception(errorMessage);
    }
  }

  /// ✅ هذا ما كنت تستخدمه سابقًا، فقط يرجع التوكن
  Future<String> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('login', data: {'email': email, 'password': password});

      print('📥 Login Status: ${response.statusCode}');
      print('📥 Login Response: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['token'];
      } else {
        throw Exception(response.data['message'] ?? 'Login failed.');
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? e.message ?? 'Login error. Please try again.';
      throw Exception(msg);
    }
  }

  /// ✅ دالة جديدة ترجع كل البيانات { message, token }
  Future<Map<String, dynamic>> loginWithFullResponse({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('login', data: {'email': email, 'password': password});

      print('📥 Full Login Response: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data; // يحتوي على message + token
      } else {
        throw Exception(response.data['message'] ?? 'Login failed.');
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? e.message ?? 'Login error.';
      throw Exception(msg);
    }
  }
}
