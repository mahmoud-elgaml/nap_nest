import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ResetButton extends StatelessWidget {
//   const ResetButton({
//     super.key,
//     required this.buttonText,
//     required this.backgroundColor,
//     required this.opacity,
//     required this.onTap,
//   });

//   final String buttonText;
//   final Color backgroundColor;
//   final double opacity;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: opacity,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: 380.w,
//           padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
//           decoration: ShapeDecoration(
//             color: backgroundColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(28.r),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               buttonText,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: const Color(0xFFF9F9F9),
//                 fontSize: 14.sp,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    this.buttonText,
    required this.backgroundColor,
    required this.opacity,
    required this.onTap,
    this.child,
  });

  final String? buttonText;
  final Color backgroundColor;
  final double opacity;
  final void Function()? onTap;
  final Widget? child; // ✅ عنصر مخصص مثل Loader

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 380.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
          ),
          child: Center(
            child:
                child ??
                Text(
                  buttonText ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFF9F9F9),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
