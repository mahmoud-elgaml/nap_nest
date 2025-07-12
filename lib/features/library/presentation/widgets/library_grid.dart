import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/library/data/model/library_section_model.dart';
import 'package:nap_nest/features/library/presentation/widgets/articles_view_body.dart';
import 'package:nap_nest/features/library/presentation/widgets/library_card.dart';

class LibraryGrid extends StatelessWidget {
  final List<LibrarySectionModel> sections;

  const LibraryGrid({super.key, required this.sections});

  String getImageForSection(String title) {
    switch (title) {
      case 'Understanding CBT':
        return Assets.imagesLibrary4;
      case 'CBT Tools & Techniques':
        return Assets.imagesLibrary2;
      case 'Sleep Education':
        return Assets.imagesLibrary3;
      case 'Managing Sleep Problems':
        return Assets.imagesLibrary4;
      case 'Breathing & Relaxation':
        return Assets.imagesLibrary5;
      default:
        return Assets.imagesLibrary3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: sections.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 14.w,
        childAspectRatio: 2.5 / 2.5,
      ),
      itemBuilder: (context, index) {
        final section = sections[index];
        return LibraryCard(
          title: section.section,
          imagePath: getImageForSection(section.section),

          onTap: () {
            Navigator.pushNamed(context, ArticlesViewBody.routeName, arguments: section.slug);
          },
        );
      },
    );
  }
}
