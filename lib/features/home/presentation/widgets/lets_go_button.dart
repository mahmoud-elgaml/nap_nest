import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class LetsGoButton extends StatelessWidget {
  const LetsGoButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 35.h,
        margin: EdgeInsets.only(left: 8.dg, top: 8.dm, right: 20.h,),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24.0.r)),
          color: AppColors.primaryColor,
        ),
        child: Text(
          "Let's go",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
      ),
    );
  }
}
