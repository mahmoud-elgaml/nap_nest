// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:nap_nest/core/utils/app_colors.dart';
// import 'package:nap_nest/core/utils/app_images.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTap;

//   const CustomBottomNavBar({Key? key, required this.selectedIndex, required this.onTap})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final icons = [
//       Assets.imagesHome,
//       Assets.imagesBed,
//       Assets.imagesMoon, // الصفحة اللي في النص وهي homeview
//       Assets.imagesStatistics,
//       Assets.imagesProfile,
//     ];

//     return Container(
//       height: 80.h,
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
//         boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), blurRadius: 16.r)],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(icons.length, (index) {
//           final icon = icons[index];
//           final isSelected = selectedIndex == index;

//           return GestureDetector(
//             onTap: () => onTap(index),
//             child:
//                 isSelected
//                     ? Container(
//                       height: 60.w,
//                       width: 60.w,
//                       margin: EdgeInsets.only(bottom: 20.h, top: 5),
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryColor,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.primaryColor.withAlpha(60),
//                             blurRadius: 8.r,
//                             offset: Offset(0, 4.h),
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           icon,
//                           height: 28.h,

//                           colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                         ),
//                       ),
//                     )
//                     : SvgPicture.asset(
//                       icon,
//                       height: 24.h,
//                       colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
//                     ),
//           );
//         }),
//       ),
//     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import 'package:nap_nest/core/utils/app_colors.dart';
// import 'package:nap_nest/core/utils/app_images.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTap;

//   const CustomBottomNavBar({Key? key, required this.selectedIndex, required this.onTap})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SalomonBottomBar(
//       currentIndex: selectedIndex,
//       onTap: onTap,
//       backgroundColor: Colors.white,
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       itemPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       items: [
//         SalomonBottomBarItem(
//           icon: SvgPicture.asset(
//             Assets.imagesHome,
//             height: 24,
//             colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
//           ),
//           title: const Text('Home'),
//           selectedColor: AppColors.primaryColor,
//           unselectedColor: Colors.grey,
//         ),
//         SalomonBottomBarItem(
//           icon: SvgPicture.asset(
//             Assets.imagesBed,
//             height: 24,
//             colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
//           ),
//           title: const Text('Sleep'),
//           selectedColor: AppColors.primaryColor,
//           unselectedColor: Colors.grey,
//         ),
//         SalomonBottomBarItem(
//           icon: SvgPicture.asset(
//             Assets.imagesMoon,
//             height: 24,
//             colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
//           ),
//           title: const Text('Home'),
//           selectedColor: AppColors.primaryColor,
//           unselectedColor: Colors.grey,
//         ),
//         SalomonBottomBarItem(
//           icon: SvgPicture.asset(
//             Assets.imagesStatistics,
//             height: 24,
//             colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
//           ),
//           title: const Text('Stats'),
//           selectedColor: AppColors.primaryColor,
//           unselectedColor: Colors.grey,
//         ),
//         SalomonBottomBarItem(
//           icon: SvgPicture.asset(
//             Assets.imagesProfile,
//             height: 24,
//             colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
//           ),
//           title: const Text('Profile'),
//           selectedColor: AppColors.primaryColor,
//           unselectedColor: Colors.grey,
//         ),
//       ],
//     );
//   }
// }


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
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [BoxShadow(color: const Color.fromRGBO(0, 0, 0, 0.12), blurRadius: 16.r)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final icon = icons[index];
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(isSelected ? 14.w : 0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: AppColors.primaryColor.withValues(alpha: 0.3),
                            blurRadius: 8.r,
                            offset: Offset(0, 4.h),
                          ),
                        ]
                        : [],
              ),
              child: SvgPicture.asset(
                icon,
                height: 26.h,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
