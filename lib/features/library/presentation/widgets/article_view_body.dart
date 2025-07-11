import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/library/data/model/article_model.dart';
import 'package:svg_flutter/svg.dart';

class ArticleViewBody extends StatelessWidget {
  final ArticleModel article;
  const ArticleViewBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 350.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: SvgPicture.asset(
                        Assets.imagesArticlebackground,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 26.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    left: 55.w,
                    child: Text(
                      article.section,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100.h,
                    right: 10.w,
                    left: 15,
                    child: Text(
                      article.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.7,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 6.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      contentTitle(article.tagline),
                      contentText(article.description),
                      SizedBox(height: 20.h),
                      contentTitle('Details'),
                      contentText(article.content),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentTitle(String text) => Text(
    text,
    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black87),
  );

  Widget contentText(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.black87,
      height: 1.4,
      fontWeight: FontWeight.w500,
    ),
  );
}

// class ArticleViewBody extends StatelessWidget {
//   final ArticleModel article;
//   const ArticleViewBody({super.key, required this.article});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF8F8F8),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 350.h,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 16.h),
//                       child: SvgPicture.asset(
//                         Assets.imagesArticlebackground,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 20.h,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.white, size: 26.sp),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//                   Positioned(
//                     top: 35.h,
//                     left: 55.w,
//                     child: Text(
//                       article.section,
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 100.h,
//                     right: 10.w,
//                     left: 15,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           article.title,
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             height: 1.6,
//                           ),
//                         ),
//                         SizedBox(height: 8.h),
//                         Text(
//                           article.description,
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white.withOpacity(0.9),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 24.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 18.w),
//                 child: Container(
//                   padding: EdgeInsets.all(16.r),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withAlpha(10),
//                         blurRadius: 6.r,
//                         offset: Offset(0, 2.h),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [contentTitle('Details'), contentText(article.content)],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget contentTitle(String text) => Text(
//     text,
//     style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black87),
//   );

//   Widget contentText(String text) => Text(
//     text,
//     style: TextStyle(
//       fontSize: 16.sp,
//       color: Colors.black87,
//       height: 1.4,
//       fontWeight: FontWeight.w500,
//     ),
//   );
// }
