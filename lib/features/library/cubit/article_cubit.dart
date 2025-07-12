import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/library/cubit/article_state.dart';
import 'package:nap_nest/features/library/data/api/article_service.dart';
import 'package:nap_nest/features/library/data/model/article_model.dart';

// class ArticlesCubit extends Cubit<ArticlesState> {
//   final ArticleService _service;
//   ArticlesCubit(this._service) : super(ArticlesInitial());

//   // void getArticlesBySection(String slug) async {
//   //   emit(ArticlesLoading());
//   //   try {
//   //     final articles = await _service.fetchArticlesBySectionSlug(slug);
//   //     emit(ArticlesLoaded(articles));
//   //   } catch (e) {
//   //     print('❌ Failed to fetch articles: $e');
//   //     emit(ArticlesError('Failed to load articles.'));
//   //   }
//   // }

//   Future<void> getArticlesBySection(String slug) async {
//     emit(ArticlesLoading());
//     try {
//       final response = await _service.get('home/nest-notes/section/$slug');
//       final data = response.data;

//       final List<ArticleModel> allArticles =
//           (data['documents'] as List).map((e) => ArticleModel.fromJson(e)).toList();

//       // إزالة التكرارات حسب title
//       final uniqueArticlesMap = <String, ArticleModel>{};
//       for (var article in allArticles) {
//         uniqueArticlesMap[article.title] = article;
//       }

//       emit(ArticlesLoaded(uniqueArticlesMap.values.toList(), tagLine: data['tagline']));
//     } catch (e) {
//       emit(ArticlesError('Failed to load articles.'));
//     }
//   }

// }

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticleService _service;
  ArticlesCubit(this._service) : super(ArticlesInitial());

  Future<void> getArticlesBySection(String slug) async {
  emit(ArticlesLoading());
  try {
    final response = await _service.getArticlesBySlug(slug);
    final data = response.data;

    final List<ArticleModel> allArticles =
        (data['documents'] as List).map((e) => ArticleModel.fromJson(e)).toList();

    // إزالة التكرارات حسب العنوان
    final uniqueArticlesMap = <String, ArticleModel>{};
    for (var article in allArticles) {
      uniqueArticlesMap[article.title] = article;
    }

    emit(ArticlesLoaded(uniqueArticlesMap.values.toList(), tagLine: data['tagline']));
  } catch (e) {
    print('❌ Error fetching articles: $e');
    emit(ArticlesError('Failed to load articles.'));
  }
}
  }

