import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';

class SuccessMessage extends StatelessWidget {
  final String? title;
  final String? message;
  final String? textButton;
  final VoidCallback? onPressed;

  const SuccessMessage({super.key, this.title, this.message, this.textButton, this.onPressed});
  static const routeName = 'successMessage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 170.h),
            Text(
              title ?? 'Way to go!',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                color: const Color(0xFF111111),
              ),
            ),
            SizedBox(height: 100.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 145.w,
                  height: 145.w,
                  decoration: const BoxDecoration(color: Color(0xFFE4EEF9), shape: BoxShape.circle),
                ),
                Container(
                  width: 115.w,
                  height: 115.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check_rounded, size: 90.w, color: Colors.white, weight: 32.0.w),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            Text(
              message ?? 'Your password has changed successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: AppColors.darkGreyTxtColor,
              ),
            ),
            SizedBox(height: 165.h),
            CustomButton(
              text: textButton ?? 'Done',
              onPressed: onPressed,
              color: AppColors.primaryColor,
              width: 380.w,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
