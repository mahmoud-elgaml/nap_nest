import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nap_nest/features/psqi/presentation/widgets/custom_container.dart';

class AnswersContainer extends StatelessWidget {
  const AnswersContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      color: const Color.fromARGB(255, 255, 254, 254),
      elevation: 1.75,

      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
      child: Container(
        width: 450.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        child: Column(
          children: [
            CustomContainer(option: '8pm : 10pm'),
            SizedBox(height: 20.h),
            CustomContainer(option: '10pm : 12am'),
            SizedBox(height: 20.h),
            CustomContainer(option: '12am : 2am'),
            SizedBox(height: 20.h),
            CustomContainer(option: '2am : 4am'),
          ],
        ),
      ),
    );
  }
}
