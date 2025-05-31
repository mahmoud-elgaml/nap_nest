import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/home/presentation/widgets/lets_go_button.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        shadowColor: Colors.grey.shade100,
        color: Colors.white,
        
        child: Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 28.h),
                  Text(
                    'Check your daily plan',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Korem ipsum dolor\n sit amet..',
                    style: TextStyle(
                      color: AppColors.darkGreyTxtColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 18.0.h),
                  const LetsGoButton(),
                  SizedBox(height: 20.0.h),
                ],
              ),
              SvgPicture.asset(Assets.imagesSleepHome, fit: BoxFit.fill),
            ],
          ),
        ),
      ),
    );
  }
}
