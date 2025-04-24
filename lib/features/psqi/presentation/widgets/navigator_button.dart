import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onPressed,
    this.side = BorderSide.none,
    this.buttonColor,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final VoidCallback? onPressed;
  final BorderSide side;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 190.w,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 22.h),
        decoration: ShapeDecoration(
          color: buttonColor,
          shape: RoundedRectangleBorder(side: side, borderRadius: BorderRadius.circular(28.r)),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
