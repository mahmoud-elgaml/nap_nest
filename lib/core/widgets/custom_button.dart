import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.color,
    super.key,
    this.onPressed,
    this.width,
  });

  final String text;
  final Color color;
  final void Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width ?? double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
      decoration: ShapeDecoration(
        color: color == Colors.transparent ? Colors.transparent : color,
        shape: RoundedRectangleBorder(
          side:
              color == Colors.transparent
                  ? BorderSide(width: 3.w, color: AppColors.primaryColor)
                  : BorderSide.none,
          borderRadius: BorderRadius.circular(28.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.w,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  color == Colors.transparent
                      ? AppColors.primaryColor
                      : Colors.white,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}
