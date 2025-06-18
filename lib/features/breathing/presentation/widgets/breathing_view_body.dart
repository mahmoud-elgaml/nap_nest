import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/breathing/presentation/view/breathing_details_view.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_appbar.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_card.dart';

class BreathingViewBody extends StatelessWidget {
  const BreathingViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               BreathingAppbar(),
              SizedBox(height: 12.h),
              BreathingCard(
                imageAsset: Assets.imagesBreathingHeart,
                title: '4-4-4-4 Breathing\n(Box Breathing)',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BreathingDetailsView.routeName,
                    arguments: {
                      'title': '7-11 Breathing',
                      'description':
                          'This is a breathing technique that helps calm the nervous system...',
                      'duration': '7 mins',
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
              BreathingCard(
                imageAsset: Assets.imagesBreathingHeart,
                title: '7-11 Breathing',
                onTap: () {},
                //
              ),
              SizedBox(height: 20.h),
              BreathingCard(imageAsset: Assets.imagesBreathingHeart, title: '3-6 Breathing'),
              SizedBox(height: 20.h),
              BreathingCard(imageAsset: Assets.imagesBreathingHeart, title: '5-5 Breathing'),
              SizedBox(height: 20.h),
              BreathingCard(imageAsset: Assets.imagesBreathingHeart, title: '1-2 Breathing'),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
