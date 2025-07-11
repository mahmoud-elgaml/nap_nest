import 'package:flutter/material.dart';
import 'package:nap_nest/features/library/data/model/article_model.dart';
import 'package:nap_nest/features/library/presentation/widgets/article_view_body.dart';

// class ArticleView extends StatelessWidget {
//   const ArticleView({super.key});
//   static const routeName = 'articleView';
//   @override
//   Widget build(BuildContext context) {
//     return ArticleViewBody();
//   }
// }

// class ArticleView extends StatelessWidget {
//   final ArticleModel article;
//   const ArticleView({super.key, required this.article});

//   static const routeName = 'articleView';

//   @override
//   Widget build(BuildContext context) {
//     return ArticleViewBody(article: article);
//   }
// }

class ArticleView extends StatelessWidget {
  final ArticleModel article;
  const ArticleView({super.key, required this.article});

  static const routeName = 'articleView';

  @override
  Widget build(BuildContext context) {
    return ArticleViewBody(article: article);
  }
}
