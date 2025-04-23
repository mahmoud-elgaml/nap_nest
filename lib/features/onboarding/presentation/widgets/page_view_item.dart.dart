import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    required this.image,
    required this.title,
    required this.description,
    Key? key,
    this.title2,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;
  final String? title2;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(image, height: 350.h, width: 380.w),
        SizedBox(height: 28.h),
        SizedBox(
          width: 380.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF111111),
                      fontSize: 26.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (title2 != null)
                    Text(
                      title2!,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 28.sp,
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 375.w,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.darkGreyTxtColor,
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
