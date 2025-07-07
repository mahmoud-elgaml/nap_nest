import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/myPlan/presentation/widgets/my_thoghts_view_body.dart';

class AnalyzeThoughtsViewBody extends StatefulWidget {
  const AnalyzeThoughtsViewBody({super.key});

  @override
  State<AnalyzeThoughtsViewBody> createState() => _AnalyzeThoughtsViewBodyState();
}

class _AnalyzeThoughtsViewBodyState extends State<AnalyzeThoughtsViewBody> {
  int? selectedIndex;

  final List<String> thoughts = [
    'Many people struggle with sleep at times. I’m not alone, and I can learn to improve my sleep.',
    'If I don’t get 8 hours of sleep, I’ll be a wreck tomorrow.',
    'Everyone else sleeps perfectly; I must be doing something wrong.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
      height: 926.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Stack(
        children: [
          // Header
          Positioned(
            left: 24.w,
            top: 74.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, size: 24.sp),
                    ),
                    Text(
                      'My Path',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                SizedBox(
                  width: 370.w,
                  child: Text(
                    'Night Notions',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Question + Options
          Positioned(
            left: 24.w,
            right: 20,
            top: 180.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'What thoughts had come to your mind today?',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: AppColors.darkGreyTxtColor ,
                  ),
                ),
                SizedBox(height: 60.h),
                for (int i = 0; i < thoughts.length; i++)
                  ThoughtOption(
                    text: thoughts[i],
                    isSelected: selectedIndex == i,
                    onTap: () => setState(() => selectedIndex = i,
                    ),
                  ),
              ],
            ),
          ),

          // Next Button
          Positioned(
            bottom: 150.h,
            left: 122.w,
            child: GestureDetector(
              onTap:
                  selectedIndex != null
                      ? () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 1000),
                            pageBuilder:
                                (_, __, ___) =>
                                    ThoughtFlipScreen(selectedThought: thoughts[selectedIndex!]),
                          ),
                        );
                      }
                      : null,

            
              child: Container(
                width: 185.w,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Next',
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
          ),
        ],
      ),
    );
  }
}

class ThoughtOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ThoughtOption({Key? key, required this.text, this.isSelected = false, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        width: 380.w,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.secondaryColor2 : const Color(0xB23F486F),
                  width: 2.w,
                ),
              ),
              child:
                  isSelected
                      ? Center(
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor2,
                          ),
                        ),
                      )
                      : null,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  color: const Color(0xFF111111),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}


