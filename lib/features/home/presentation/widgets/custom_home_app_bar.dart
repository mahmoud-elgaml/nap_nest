import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 74.h),
          Text(
            'Hello, Mahmoud',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              //
            ),
          ),
          Text(
            'Have a nice day!',
            style: TextStyle(
              color: const Color(0xFFE7A786),
              fontSize: 16.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
