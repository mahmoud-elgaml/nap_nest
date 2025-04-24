import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/answer_container.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/navigator_button.dart';

class PsqiViewBody extends StatelessWidget {
  const PsqiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 54.h),
              Text(
                'PSQI Test',
                style: TextStyle(
                  color: AppColors.darkGreyTxtColor,
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30.h),
              LinearProgressBar(
                maxSteps: 20,
                currentStep: 9,
                progressColor: AppColors.secondaryColor2,
                backgroundColor: AppColors.containerColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              SizedBox(height: 10.h),
              Text(
                'Question 9 of 17',
                style: TextStyle(
                  color: const Color(0xFF9EA8B9),
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'During the past month, what time have you usually gone to bed at night?',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 45.h),
              AnswersContainer(),
            ],
          ),
        ),
        SizedBox(height: 44.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigatorButton(
              buttonColor: Colors.transparent,
              text: 'Previous',
              textColor: AppColors.primaryColor,
              side: BorderSide(color: AppColors.primaryColor, width: 2.5.w),
              onPressed: () {},
            ),
            NavigatorButton(
              text: 'Next',
              textColor: Colors.white,
              buttonColor: AppColors.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
