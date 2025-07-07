import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/success_message_view.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({super.key});
  static const routeName = 'AlarmSettingsScreen';

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 30);

  void _onTimeChanged(TimeOfDay newTime) {
    setState(() {
      selectedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 428.w,
        height: 926.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFBFD7F2),
              const Color(0xFF9F8CCC).withOpacity(0.3),
              const Color(0xFFBFD7F2),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 80.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Nest Time',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  'Set your wake up time',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 100.h),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 250.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12.r,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime(2022, 1, 1, selectedTime.hour, selectedTime.minute),
                      use24hFormat: false,
                      onDateTimeChanged: (DateTime dateTime) {
                        _onTimeChanged(TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => SuccessMessage(
                                title: 'Well Done!',
                                message: 'Your wake up time has been set successfully.',
                                textButton: 'Continue',
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName, (route) => false);
                                },
                              ),
                        ),
                      );
                    },

                    child: Container(
                      width: 185.w,
                      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    'Alarm set for ${selectedTime.format(context)}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
