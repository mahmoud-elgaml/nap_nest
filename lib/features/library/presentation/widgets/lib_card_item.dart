import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/home__items_model.dart';

class LibCardItem extends StatelessWidget {
  const LibCardItem({super.key, required this.libModel, required this.onTap});
  final HomeItemsModel libModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: const Color(0xFFE4EEF9),
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 150.w,
              height: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SvgPicture.asset(libModel.imagePath, fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    libModel.title,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  Text(libModel.duration, style: TextStyle(fontSize: 16.sp)),
                ],
              ),
            ),
            Icon(Icons.play_circle_outline, size: 32, color: AppColors.darkGreyTxtColor),
          ],
        ),
      ),
    );
  }
}
