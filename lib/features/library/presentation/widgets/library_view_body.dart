import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/library/presentation/views/article_view.dart';
import 'package:nap_nest/features/library/presentation/widgets/library_card.dart';

class LibraryViewBody extends StatelessWidget {
  const LibraryViewBody({super.key});
  static const routeName = 'libraryViewBody';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w,left: 16.w ,bottom: 80.h,top: 16.h),
          child: Column(
            children: [
              CustomAppbar(
                popText: 'Home',
                title: 'Library',
                subtitle: 'Your calming guide to better sleep.',
              ),
              LibraryGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryGrid extends StatelessWidget {
  const LibraryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Understanding CBT', 'image': Assets.imagesLibrary4},
      {'title': 'CBT Tools & Techniques', 'image': Assets.imagesLibrary2},
      {'title': 'Sleep Education', 'image': Assets.imagesLibrary3},
      {'title': 'Managing Sleep Problems', 'image': Assets.imagesLibrary4},
      {'title': 'Breathing & Relaxation Guides', 'image': Assets.imagesLibrary5},
    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 14.w,
        childAspectRatio: 2.5 /2.5,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return LibraryCard(
          title: item['title']!, 
          imagePath: item['image']!,
          onTap: () => Navigator.pushNamed(context, ArticleView.routeName),
          );
      },
    );
  }
}
