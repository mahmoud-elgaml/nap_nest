import 'package:dio/dio.dart';
import 'package:nap_nest/features/library/data/api/home_api.dart';
import 'package:nap_nest/features/library/data/model/article_model.dart';

class ArticleService {
  final Dio _dio = HomeApiService.dio;

  // جلب مقالة واحدة
  Future<ArticleModel> fetchArticle(int id) async {
    final response = await _dio.get('home/nest-notes/$id');
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch article');
    }
  }


  Future<List<ArticleModel>> fetchArticlesBySectionSlug(String slug) async {
    final response = await _dio.get('home/nest-notes/section/$slug');

    if (response.statusCode == 200) {
      final data = response.data['documents'] as List;
      return data.map((e) => ArticleModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

}
