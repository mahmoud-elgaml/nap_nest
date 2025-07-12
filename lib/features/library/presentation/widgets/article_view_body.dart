import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/library/data/model/article_model.dart';

class ArticleViewBody extends StatelessWidget {
  final ArticleModel article;
  const ArticleViewBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔷 الصورة الخلفية + النصوص
              Stack(
                children: [
                Container(
                    height: 320.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      Assets.imagesArticlebackground,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 320.h,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.45),
                  ),
                  Positioned(
                    top: 16.h,
                    left: 12.w,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 26.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 16.w,
                    right: 16.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.section,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          article.title,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          article.description,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white.withOpacity(0.95),
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // 🔷 المحتوى
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    contentTitle('Details'),
                    SizedBox(height: 14.h),
                    contentText(article.content),

                    SizedBox(height: 24.h),

                    contentTitle('Breaking the Cycle'),
                    SizedBox(height: 10.h),
                    contentText(
                      'Anticipatory anxiety about sleep can make bedtime feel like a threat rather than a relief. '
                      'CBT-I helps shift this perspective through consistent routines, stimulus control, and relaxation strategies.',
                    ),

                    SizedBox(height: 24.h),

                    contentTitle('Real Impact'),
                    SizedBox(height: 10.h),
                    contentText(
                      'Studies have shown that CBT-I leads to long-term improvement in sleep quality, '
                      "reduces the need for medication, and improves overall well-being. It's more than therapy — "
                      "it's a skillset for lifelong sleep health.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentTitle(String text) => Text(
    text,
    style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.bold, color: Colors.black87),
  );

  Widget contentText(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.black87,
      height: 1.8,
      fontWeight: FontWeight.w500,
    ),
  );
}
