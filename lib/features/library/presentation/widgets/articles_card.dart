import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

// class ArticlesCard extends StatelessWidget {
//   final String imageAsset;
//   final String title;
//   final VoidCallback? onTap;

//   const ArticlesCard({super.key, required this.imageAsset, required this.title, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 100.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color(0xFFe8dff5),
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//         child: Row(
//           children: [
//             Container(
//               width: 60.w,
//               height: 60.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14.r),
//                 border: Border.all(color: AppColors.secondaryColor, width: 1.7.w),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(6.r),
//                 child: SvgPicture.asset(
//                   imageAsset,
//                   fit: BoxFit.cover,
//                   color: AppColors.secondaryColor,
//                 ),
//               ),
//             ),
//             SizedBox(width: 14.w),
//             Expanded(
//               child: Text(
//                 title,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, height: 1.3),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ArticlesCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback? onTap;

  const ArticlesCard({super.key, required this.imageAsset, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFe8dff5),
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: AppColors.secondaryColor, width: 1.7.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.r),
                child: SvgPicture.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
