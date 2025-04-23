import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';
import 'package:nap_nest/features/userInfo/gender_view_body.dart';
import 'package:nap_nest/features/userInfo/widgets/build_drobdown.dart';

class BirthdayViewBody extends StatefulWidget {
  static const routeName = 'birthday';
  const BirthdayViewBody({super.key});

  @override
  BirthdayViewBodyState createState() => BirthdayViewBodyState();
}

class BirthdayViewBodyState extends State<BirthdayViewBody> {
  String? selectedMonth;
  String? selectedDay;
  String? selectedYear;

  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final List<String> days = List.generate(31, (index) => (index + 1).toString());

  final List<String> years = List.generate(
    100,
    (index) => (DateTime.now().year - index).toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64.0, bottom: 80.0, right: 24, left: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65.h, width: 382.w),
            Text(
              'When’s Your Birthday?',
              style: TextStyle(fontSize: 30.sp, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Text(
              'Your age information will be updated on your profile page and this will displayed publicly on your dashboard',
              style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
            ),
            SizedBox(height: 200.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDropdown('MM', months, (value) {
                  setState(() => selectedMonth = value);
                }),
                const SizedBox(width: 10),
                buildDropdown('DD', days, (value) {
                  setState(() => selectedDay = value);
                }),
                const SizedBox(width: 10),
                buildDropdown('YYYY', years, (value) {
                  setState(() => selectedYear = value);
                }),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Next',
                color: AppColors.primaryColor,
                onPressed: () {
                  (selectedMonth != null && selectedDay != null && selectedYear != null)
                      ? () {
                        log('Selected Date: $selectedMonth $selectedDay, $selectedYear');
                      }
                      : null;
                  Navigator.pushNamed(context, GenderViewBody.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
