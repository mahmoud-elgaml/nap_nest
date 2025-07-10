import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/breathing/presentation/view/breathing_details_view.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_card.dart';


  class BreathingViewBody extends StatelessWidget {
  const BreathingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                popText: 'Home',
                title: 'Breathing Nest',
                subtitle: 'Select your preferred relaxing breathe exercise to do.',
              ),
              SizedBox(height: 16.h),

              BreathingCard(
                imageAsset: Assets.imagesBreathingHeart,
                title: '7-11 Breathing',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BreathingDetailsView.routeName,
                    arguments: {
                      'title': '7-11 Breathing',
                      'description':
                          '1. Inhale deeply through your nose for 7 counts.\n'
                          '2. Exhale slowly and completely through your mouth for 11 counts.\n'
                          '3. Maintain a steady rhythm, ensuring the exhale is longer than the inhale.\n\n'
                          'Benefits: Reduces anxiety, slows heart rate, and promotes relaxation. Great for managing stress quickly.',
                      'duration': '3-5 min',
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
              BreathingCard(
                imageAsset: Assets.imagesBreathingHeart,
                title: '4-4-4-4 Breathing\n(Box Breathing)',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BreathingDetailsView.routeName,
                    arguments: {
                      'title': '4-4-4-4 Breathing',
                      'description':
                          'Breathe in for 4, hold for 4, exhale for 4, hold for 4.\n\nUsed to regain control in stressful moments.',
                      'duration': '2-4 min',
                    },
                  );
                },
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

