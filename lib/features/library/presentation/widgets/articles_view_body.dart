import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/library/cubit/article_cubit.dart';
import 'package:nap_nest/features/library/cubit/article_state.dart';
import 'package:nap_nest/features/library/data/api/article_service.dart';
import 'package:nap_nest/features/library/data/model/article_model.dart';
import 'package:nap_nest/features/library/presentation/views/article_view.dart';
import 'package:nap_nest/features/library/presentation/widgets/articles_card.dart';

// class ArticlesViewBody extends StatelessWidget {
//   const ArticlesViewBody({super.key});
//   static const routeName = 'ArticlesViewBody';

//   @override
//   Widget build(BuildContext context) {
//     final slug = ModalRoute.of(context)?.settings.arguments as String? ?? 'understanding-cbt';

//     return BlocProvider(
//       create: (_) => ArticlesCubit(ArticleService())..getArticlesBySection(slug),
//       child: Scaffold(
//         body: SafeArea(
//           child: BlocBuilder<ArticlesCubit, ArticlesState>(
//             builder: (context, state) {
//               if (state is ArticlesLoading) {
//                 return const Center(child: CustomAppLoading());
//               } else if (state is ArticlesLoaded) {
//                 final articles = state.articles;
//                 return SingleChildScrollView(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomAppbar(
//                         popText: 'Library',
//                         title: slug.replaceAll('-', ' '),
//                         subtitle: 'Learn how your thoughts shape your sleep.',
//                       ),
//                       SizedBox(height: 20.h),
//                       ...articles.map(
//                         (article) => Padding(
//                           padding: EdgeInsets.only(bottom: 20.h),
//                           child: ArticlesCard(
//                             imageAsset: Assets.imagesBed,
//                             title: article.title,
//                             onTap: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 ArticleView.routeName,
//                                 arguments: article,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (state is ArticlesError) {
//                 return Center(child: Text(state.message));
//               } else {
//                 return const SizedBox();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key});
  static const routeName = 'ArticlesViewBody';

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context)?.settings.arguments as String? ?? 'understanding-cbt';

    return BlocProvider(
      create: (_) => ArticlesCubit(ArticleService())..getArticlesBySection(slug),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ArticlesCubit, ArticlesState>(
            builder: (context, state) {
              if (state is ArticlesLoading) {
                return const Center(child: CustomAppLoading());
              } else if (state is ArticlesLoaded) {
                final uniqueArticles = <String, ArticleModel>{};
                for (var article in state.articles) {
                  uniqueArticles[article.title] = article;
                }

                final articles = uniqueArticles.values.toList();

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppbar(
                        popText: 'Nest Notes',
                        title: slug.replaceAll('-', ' '),
                        subtitle: articles.isNotEmpty ? articles.first.tagline : '',
                      ),
                      SizedBox(height: 20.h),
                      ...articles.map(
                        (article) => Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: ArticlesCard(
                            imageAsset: Assets.imagesBed,
                            title: article.title,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ArticleView.routeName,
                                arguments: article,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ArticlesError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
