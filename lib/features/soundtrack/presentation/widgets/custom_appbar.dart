import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class SoundTrackAppbar extends StatelessWidget {
  const SoundTrackAppbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, size: 32.sp),
              ),
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
          SizedBox(height: 24.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Soundtracks', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 9.h),
              Text(
                'Select your preferred relaxing soundtrack to listen to.',
                style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
              ),
            ],
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
