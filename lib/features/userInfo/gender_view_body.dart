import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_view.dart';
import 'package:nap_nest/features/userInfo/widgets/gender_option_tile.dart';

class GenderViewBody extends StatefulWidget {
  static const routeName = 'GenderView';

  @override
  State<GenderViewBody> createState() => _GenderViewBodyState();
}

class _GenderViewBodyState extends State<GenderViewBody> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 74.w, bottom: 80.w, right: 24.w, left: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70.h, width: 382.w),
            Text(
              'Choose Your Gender',
              style: TextStyle(fontSize: 30.sp, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Text(
              'Your Gender information will be updated on your profile page and this will be displayed publicly on your dashboard',
              style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
            ),
            SizedBox(height: 130.h),

            GenderOptionTile(
              label: 'Male',
              isSelected: selectedGender == 'Male',
              onTap: () => setState(() => selectedGender = 'Male'),
            ),
            SizedBox(height: 24.h),
            GenderOptionTile(
              label: 'Female',
              isSelected: selectedGender == 'Female',
              onTap: () => setState(() => selectedGender = 'Female'),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Next',
                color: AppColors.primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, PsqiView.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
