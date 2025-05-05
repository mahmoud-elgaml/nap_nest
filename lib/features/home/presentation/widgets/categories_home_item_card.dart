import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesHomeItemCard extends StatelessWidget {
  final String title;
  final String iconAsset;
  final String backgroundAsset;
  final void Function()? onPressed;
  const CategoriesHomeItemCard({
    super.key,
    required this.title,
    required this.iconAsset,
    required this.backgroundAsset,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 179.w,
        height: 126.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(child: SvgPicture.asset(backgroundAsset, fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: SvgPicture.asset(
                iconAsset,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 28.w,
                height: 28.h,
                //
              ),
            ),
            Positioned(
              bottom: 16.h,
              left: 16.w,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  //
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
