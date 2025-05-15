import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/animated_success_icon.dart';

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
      backgroundColor: const Color.fromRGBO(246, 247, 251, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const SizedBox(height: 120),
            Text(
              title ?? 'Way to go!',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF111111),
              ),
            ).animate().fadeIn(duration: 500.ms).moveY(begin: -20, end: 0),
            SizedBox(height: 100.h),
            const AnimatedSuccessIcon(),
            SizedBox(height: 100.h),
            Text(
                  message ?? 'Your password has changed successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGreyTxtColor,
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms)
                .then(delay: 200.ms)
                .addEffect(
                  MoveEffect(
                    begin: const Offset(0, 20),
                    end: Offset.zero,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  ),
                ),
            SizedBox(height: 100.h),
            Animate(
              effects: [
                FadeEffect(duration: 400.ms),
                ScaleEffect(
                  begin: const Offset(1.0, 1.0),
                  end: const Offset(1.05, 1.05),
                  duration: 1000.ms,
                  curve: Curves.easeInOut,
                  delay: 400.ms,
                ),
              ],
              onPlay: (controller) => controller.repeat(reverse: true),
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryColor, Color(0xFF3B82F6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(96, 165, 250, 0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    textButton ?? 'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
