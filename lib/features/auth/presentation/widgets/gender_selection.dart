import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class GenderSelectionField extends StatefulWidget {
  const GenderSelectionField({super.key});

  @override
  State<GenderSelectionField> createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends State<GenderSelectionField> {
  String selectedGender = '';

  Widget buildGenderOption(String gender) {
    final bool isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding:  EdgeInsets.only(top: 12.h, right: 18.w, bottom: 12.h, left: 12.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFE2E4E8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor, width: 2.5.w),
              ),
              child:
                  isSelected
                      ? Center(
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                      : null,
            ),
             SizedBox(width: 10.w),
            Text(
              gender,
              style:  TextStyle(
                color: Color(0xFF111111),
                fontSize: 16.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Gender',
            style: TextStyle(
              color: Color(0xFF414E61),
              fontSize: 16.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
           SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildGenderOption('Male'), buildGenderOption('Female')],
          ),
        ],
      ),
    );
  }
}
