import 'package:flutter/material.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 40,

        height: 40,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              strokeWidth: 4,
              strokeCap: StrokeCap.round,
              value: null, // غير محدد => مستمر
            );
          },
        ),
      ),
    );
  }
}
