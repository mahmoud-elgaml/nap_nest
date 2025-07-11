import 'package:dio/dio.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/features/library/data/api/home_api.dart';
import 'package:nap_nest/features/library/data/model/library_section_model.dart';

class LibraryService {
  final Dio _dio = HomeApiService.dio;
  Future<List<LibrarySectionModel>> fetchSections() async {
    final token = Prefs.getString('token');
    print('🔐 Using token: $token');
    if (token == null || token.isEmpty) {
      throw Exception('No token found');
    }
    try {
      final response = await _dio.get(
        'home/nest-notes/sections',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',   
            'Accept': 'application/json', 
          },
        ),
      );

      final data = response.data as List;
      return data.map((e) => LibrarySectionModel.fromJson(e)).toList();
    } on DioException catch (e) {
      print('❌ Dio Error: ${e.response?.statusCode} - ${e.response?.data}');
      throw Exception('Failed to load sections.');
    }
  }

}
