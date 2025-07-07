import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class ArticleViewBody extends StatelessWidget {
  const ArticleViewBody({super.key});

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
                  // AppBar
                  Positioned(
                    top: 20.h,
                    // left: 8.w,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 26.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    left: 55.w,
                    child: Text(
                      'Sleep Disturbances',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Title below SVG
                  Positioned(
                    top: 100.h,
                    right: 10.w,
                    left: 15,
                    child: Text(
                      'What Is Cognitive Behavioral Therapy? A beginner’s guide to CBT and how thoughts, feelings, and behaviors interact.',
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
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 6.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      contentTitle('What is CBT?'),
                      contentText(
                        'CBT is a type of talking treatment that focuses on how your thoughts, beliefs and attitudes affect your feelings and behaviour, and teaches you coping skills for dealing with different problems. It combines cognitive therapy (examining the things you think) and behaviour therapy (examining the things you do). “I have depression. [CBT is] very, very good for helping [me] not listen to [my] self critical voice, which is so damaging.”',
                      ),
                      SizedBox(height: 20.h),
                      contentTitle("What's the theory behind CBT?"),
                      contentText(
                        'CBT is based on the idea that the way we think about situations can affect the way we feel and behave. For example, if you interpret a situation negatively then you might experience negative emotions as a result, and those bad feelings might then lead you to behave in a certain way.',
                      ),
                      SizedBox(height: 20.h),
                      contentTitle('How does negative thinking start?'),
                      contentText(
                        'Negative thinking patterns can start from childhood onwards. For example, if you didn’t receive much attention or praise from your parents or teachers at school, you might thought “I’m useless, I’m not good enough”. Over time you might come to believe these assumptions, until as an adult these negative thoughts become automatic. This way of thinking might then affect how you feel at work, university or in your general life.',
                      ),
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

  Widget contentTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }

  Widget contentText(String text) {
    return Text(text, style: TextStyle(fontSize: 14.5.sp, color: Colors.black87, height: 1.6,fontWeight: FontWeight.w500));
  }
}
