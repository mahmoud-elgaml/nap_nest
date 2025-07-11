import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/library/cubit/article_state.dart';
import 'package:nap_nest/features/library/data/api/article_service.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticleService _service;
  ArticlesCubit(this._service) : super(ArticlesInitial());

  void getArticlesBySection(String slug) async {
    emit(ArticlesLoading());
    try {
      final articles = await _service.fetchArticlesBySectionSlug(slug);
      emit(ArticlesLoaded(articles));
    } catch (e) {
      print('❌ Failed to fetch articles: $e');
      emit(ArticlesError('Failed to load articles.'));
    }
  }
}
