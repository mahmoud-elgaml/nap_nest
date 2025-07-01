import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/library/presentation/widgets/library_card.dart';

class LibraryViewBody extends StatelessWidget {
  const LibraryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              CustomAppbar(
                popText: 'Home',
                title: 'Library',
                subtitle: 'Your calming guide to better sleep.',
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: LibraryGrid(),
                //
              ),
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
      {'title': 'Understanding CBT', 'image': Assets.imagesSound1},
      {'title': 'CBT Tools & Techniques', 'image': Assets.imagesSound2},
      {'title': 'Sleep Education', 'image': Assets.imagesSound3},
      {'title': 'Managing Sleep Problems', 'image': Assets.imagesSound4},
      {'title': 'Breathing & Relaxation Guides', 'image': Assets.imagesSound1},
      {'title': 'More Sleep Tips', 'image': Assets.imagesSound2},
    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 14.w,
        childAspectRatio: 2.5 /2.8,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return LibraryCard(title: item['title']!, imagePath: item['image']!);
      },
    );
  }
}
