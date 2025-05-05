import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_appbar.dart';

class BreathingViewBody extends StatelessWidget {
  const BreathingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const BreathingAppbar(), 
            SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
