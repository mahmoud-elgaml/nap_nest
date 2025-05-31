import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BreathingCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback? onTap;
  const BreathingCard({super.key, required this.imageAsset, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 89.h,
        width: 380.w,
        decoration: BoxDecoration(
          color: const Color(0xFFE4EEF9),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(imageAsset, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
