import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({Key? key, required this.selectedIndex, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [
      Assets.imagesHome,
      Assets.imagesBed,
      Assets.imagesMoon,
      Assets.imagesStatistics,
      Assets.imagesProfile,
    ];

    return Container(
      height: MediaQuery.of(context).size.height * (70 / 812),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(31, 47, 45, 45),
            blurRadius: 16.r,
            //
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 20.h,
            child: Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              final icon = icons[index];
              final isSelected = selectedIndex == index;
              final isCenter = index == 2;
              return GestureDetector(
                onTap: () => onTap(index),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isCenter ? 10 : 8.h,
                    left: isCenter ? 4 : 0,
                    bottom: isCenter ? 22 : 12,
                  ),
                  child: SvgPicture.asset(
                    icon,
                    height: 28.h,
                    colorFilter: ColorFilter.mode(
                      isCenter ? Colors.white : (isSelected ? AppColors.primaryColor : Colors.grey),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}


