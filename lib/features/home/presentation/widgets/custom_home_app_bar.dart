import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  CustomHomeAppBar({super.key});
  final String rawName = Prefs.getString('name') ?? 'User';
  String get name => rawName[0].toUpperCase() + rawName.substring(1);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 74.h),
          Text(
            'Hello,$name',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w900,
              //
            ),
          ),

     Text(
      'Have a nice day 😊✨',
      style: TextStyle(
        color: AppColors.orangeColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        shadows: [
          Shadow(
            color: AppColors.orangeColor.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    )
        .animate(onPlay: (controller) => controller.repeat())
        .fadeIn(duration: 800.ms, curve: Curves.easeOut)
        .scaleXY(begin: 0.96, end: 1.04, duration: 1400.ms, curve: Curves.easeInOut)
        .shimmer(duration: 2200.ms, color: AppColors.orangeColor)
        .moveY(begin: 4, end: -4, duration: 1800.ms, curve: Curves.easeInOut),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
