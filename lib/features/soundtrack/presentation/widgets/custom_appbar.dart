import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class Appbar extends StatelessWidget {
  const Appbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 32.sp),
              SizedBox(width: 4.w),
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  //
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Soundtracks',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111111),
                ),
              ),
              SizedBox(height: 9),
              Text(
                'Select your preferred relaxing soundtrack to listen to.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGreyTxtColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
