import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BreathingDetailsViewBody extends StatelessWidget {
  const BreathingDetailsViewBody({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    //
  });
  final String title;
  final String description;
  final String duration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Moon and clouds image overlay
          Positioned.fill(
            child: SvgPicture.asset(Assets.imagesBreathingBackground, fit: BoxFit.fill),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 10.h),

                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16.sp, height: 1.6.h, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer, color: Colors.white70, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(duration, style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                        padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 14.h),
                      ),
                      onPressed: () {
                        // Navigate to breathing timer screen
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
