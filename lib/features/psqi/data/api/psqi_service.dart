 import 'package:dio/dio.dart';
import 'package:nap_nest/features/psqi/data/model/question_model.dart';

class PsqiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/',
    ),
  );

  Future<List<QuestionModel>> getPsqiQuestions(String token) async {
    final response = await _dio.get(
      'psqi/questions',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final List data = response.data['questions'];
    return data.map((q) => QuestionModel.fromJson(q)).toList();
  }

  Future<Map<String, dynamic>> submitPsqiAnswers(
    int userId,
    Map<String, String> answers,
    String token,
  ) async {
    try {
      final response = await _dio.post(
        'psqi/submit/$userId',
        data: {'answers': answers},
        options: Options(
          headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
          followRedirects: false,
          validateStatus: (status) => status != null && status < 400,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to submit answers: $e');
    }
  }
}