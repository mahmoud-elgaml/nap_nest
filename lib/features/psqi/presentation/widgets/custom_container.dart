import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String option;

  const CustomContainer({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 61,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 244, 246),
        borderRadius: BorderRadius.circular(18.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 22.h,
            height: 22.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 3.h),
            ),
          ),
          SizedBox(width: 14.h),
          Text(
            option,
            style: TextStyle(fontSize: 16.sp, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
