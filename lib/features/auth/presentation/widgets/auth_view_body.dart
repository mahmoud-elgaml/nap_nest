import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';
import 'package:nap_nest/features/auth/presentation/view/login_view.dart';
import 'package:nap_nest/features/auth/presentation/view/register_view.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});
  static const routeName = 'authScreen';

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: EdgeInsets.all(24.0.sp),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 85.w, vertical: 65.h),
            width: 162.w,
            height: 134.h,
            child: Image.asset(Assets.imagesAppIcon, fit: BoxFit.cover),
          ),
          SizedBox(height: 24.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Relax, Sleep, Thrive',
                style: TextStyle(
                  color: const Color(0xFF111111),
                  fontSize: 32.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 375.w,
            height: 90.h,
            child: AutoSizeText(
              'Enjoy guided relaxation tools and expert tips that help you unwind and sleep better. With real-time brainwave tracking, gain insights that empower you to take control of your sleep and thrive every day.',
              textAlign: TextAlign.center,
              maxLines: 4,
              style: TextStyle(
                color: AppColors.darkGreyTxtColor,
                fontSize: 16.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24.h,
              children: [
                CustomButton(
                  text: 'Sign Up',
                  color: const Color(0xFF74B2E7),
                  width: double.infinity,
                  onPressed: () => Navigator.pushReplacementNamed(context, RegisterView.routeName),
                ),
                CustomButton(
                  color: Colors.transparent,
                  text: 'Login',
                  width: double.infinity,
                  onPressed:
                      () => Navigator.pushReplacementNamed(context, LoginView.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
