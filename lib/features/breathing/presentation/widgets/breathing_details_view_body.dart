import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_timer_excercise.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BreathingDetailsViewBody extends StatelessWidget {
  const BreathingDetailsViewBody({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
  });

  final String title;
  final String description;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.imagesArticlebackground,
              fit: BoxFit.fill,
              //
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24.sp,
                          //
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Breathing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(Icons.play_circle_filled_outlined, color: Colors.grey, size: 38.sp),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Description Text (multi-line with breaks)
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 18.sp, height: 1.7),
                  ),

                  SizedBox(height: 50.h),
                  Container(
                    width: 110.w,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.white70, size: 20.sp),
                        SizedBox(width: 6.w),
                        Text(duration, style: TextStyle(color: Colors.white70, fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, BreathingTimerView.routeName);
                        // Start breathing logic or navigate
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(276, 57),
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 14.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 70.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
