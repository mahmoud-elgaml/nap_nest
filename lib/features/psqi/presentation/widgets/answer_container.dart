import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/psqi/data/model/psqi_option.dart';

class AnswersContainer extends StatelessWidget {
  final List<PsqiOption> options;
  final String? selected;
  final Function(String) onTap;

  const AnswersContainer({
    Key? key,
    required this.options,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      color: const Color.fromARGB(255, 255, 254, 254),
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
      child: Container(
        width: 450.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        child: Column(
          children:
              options.map((opt) {
                final isSelected = opt.value == selected;
                return GestureDetector(
                  onTap: () => onTap(opt.value),
                  child: Container(
                    width: 380.w,
                    height: 61.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 244, 246),
                      borderRadius: BorderRadius.circular(18.w),
                      border:
                          isSelected
                              ? Border.all(color: AppColors.primaryColor, width: 2)
                              : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 22.h,
                          height: 22.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.secondaryColor2, width: 1.5.h),
                            color: isSelected ? AppColors.secondaryColor2 : Colors.transparent,
                          ),
                        ),
                        SizedBox(width: 14.h),
                        Text(
                          opt.label,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
