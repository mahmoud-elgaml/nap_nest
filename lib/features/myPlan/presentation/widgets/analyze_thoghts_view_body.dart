import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';

class AnalyzeThoghtsViewBody extends StatelessWidget {
  const AnalyzeThoghtsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
      height: 926.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Stack(
        children: [
          // Title
          Positioned(
            left: 24.w,
            top: 74.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, size: 24.sp),
                    ),
                    Text(
                     'My Plan',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        //
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                 SizedBox(
                  width: 370,
                  child: Text(
                    'What thoughts had come to your mind today?',
                    style: TextStyle(
                      color: const Color(0xFF414E61),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 24.w,
            top: 208.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What thoughts had come to your mind today?',
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    height: 1.8,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: AppColors.darkGreyTxtColor,
                  ),
                ),
                SizedBox(height: 40.h),
                for (final text in [
                  'Many people struggle with sleep at times. I’m not alone, and I can learn to improve my sleep.',
                  'If I don’t get 8 hours of sleep, I’ll be a wreck tomorrow.',
                  'Everyone else sleeps perfectly; I must be doing something wrong.',
                ])
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    width: 380.w,
                    decoration: BoxDecoration(
                      color: const Color(0x4CC1A5E4),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xB23F486F), width: 2.w),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: const Color(0xFF111111),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 100.h,
            left: 122.w,
            child: Container(
              width: 184,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              decoration: ShapeDecoration(
                color: const Color(0xFF74B2E7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFF9F9F9),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
