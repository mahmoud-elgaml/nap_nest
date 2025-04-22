import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class GenderOptionTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderOptionTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        height: 85.h,
        decoration: ShapeDecoration(
          color: AppColors.containerColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        ),
        child: Row(
          children: [
            Container(
              width: 22.h,
              height: 22.w,
              decoration: ShapeDecoration(
                shape: const CircleBorder(
                  side: BorderSide(width: 2.5, color: AppColors.primaryColor),
                ),
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Center(
                        child: Icon(Icons.check_outlined, size: 16, color: Colors.white),
                      )
                      : null,
            ),
            SizedBox(width: 14.w),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF111111),
                fontSize: 16.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
