import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/library/presentation/widgets/articles_card.dart';

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key});
static const routeName = 'ArticlesViewBody';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  popText: 'Library',
                  title: 'Understanding CBT',
                  subtitle: 'Learn how your thoughts shape your sleep.',
                ),            
                SizedBox(height: 20.h),
                ArticlesCard(imageAsset: Assets.imagesBed, title: 'What Is Cognitive Behavioral Therapy?'),
                SizedBox(height: 20.h),
                ArticlesCard(imageAsset: Assets.imagesBed, title: 'CBT-I: A Targeted Therapy for Insomnia..'),
                SizedBox(height: 20.h),
                ArticlesCard(imageAsset: Assets.imagesBed, title: 'CBT vs Medication..'),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
