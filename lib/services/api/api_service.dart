import 'package:dio/dio.dart';
import 'package:nap_nest/features/auth/data/models/patient_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/',
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

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
      if ((response.statusCode == 200 || response.statusCode == 201) && response.data['patient'] != null) {
        return PatientModel.fromJson(response.data['patient']);
      } else {
        print('❌No patient found in response.');
        return null;
      }
    } on DioException catch (e) {
      print('❌DioException caught: ${e.response?.data}');
      String errorMessage = 'Something went wrong';

      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;

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
      }

      throw Exception(errorMessage);
    }
  }
}
