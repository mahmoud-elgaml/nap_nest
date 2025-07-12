import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/breathing/presentation/view/breathing_view.dart';
import 'package:nap_nest/features/myPlan/presentation/views/analyze_thoghts_view.dart';
import 'package:nap_nest/features/myPlan/presentation/widgets/challenge_negative_body.dart';
import 'package:nap_nest/features/soundtrack/presentation/view/sound_track_view.dart';

class MyPlanViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            'My Path',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              //
            ),
          ),
          SizedBox(height: 6.h),

          Text(
            'Complete your daily plan to get better sleep.',
            style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
          ),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  TimelineDot(isActive: true),
                  TimelineLine(),
                  TimelineDot(isActive: true),
                  TimelineLine(),
                  TimelineDot(isActive: false),
                  TimelineLine(),
                  TimelineDot(isActive: false),
                ],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  children: [
                    StepCard(
                      title: 'Night Notions',
                      duration: '2 min',
                      icon: Icons.psychology_outlined,
                      iconColor: Color(0xFFC1A5E4),
                      bgColor: Color(0x4CC1A5E4),
                      onTap: () => Navigator.pushNamed(context, AnalyzeThoghtsView.routeName),
                    ),
                    SizedBox(height: 16.h),
                    StepCard(
                      title: 'Challenge negative thoughts',
                      duration: '3 min',
                      icon: Icons.menu_book_outlined,
                      iconColor: Color(0xFFE7A786),
                      bgColor: Color(0x4CE7A786),
                      onTap: () => Navigator.pushNamed(context, NegativeThoughtsView.routeName),

                    ),
                    SizedBox(height: 16.h),
                    StepCard(
                      title: 'Breathing Nest',
                      duration: '2 min',
                      icon: Icons.air_outlined,
                      iconColor: Color(0xFF74B2E7),
                      bgColor: Color(0x4D74B2E7),
                      onTap: () => Navigator.pushNamed(context, BreathingView.routeName),
                    ),
                    SizedBox(height: 16.h),
                    StepCard(
                      title: 'SleepTunes',
                      duration: '11 min',
                      icon: Icons.graphic_eq_outlined,
                      iconColor: Color(0xFF5ABE8F),
                      bgColor: Color(0x3D5ABE8F),
                                            onTap: () => Navigator.pushNamed(context, SoundTrackView.routeName),

                    ),
                  ],
                ),
              ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
            elevation: 8,
            shadowColor: const Color(0x19273377),
            color: const Color(0xFFF6F7FB),
            child: Container(
              width: 380.w,
              height: 177.h,
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nest Time',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF111111),
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Korem ipsum dolor sit amet.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF9EA8B9),
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Container(
                        width: 123.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(28.r),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Let’s go',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFF9F9F9),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Assets.imagesSleepHome,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineDot extends StatelessWidget {
  final bool isActive;

  const TimelineDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child:
          isActive
              ? Center(
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
              : null,
    );
  }
}

class TimelineLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 2.5, height: 50, child: CustomPaint(painter: DashedLinePainter()));
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.primaryColor.withOpacity(0.3)
          ..strokeWidth = 2.5;

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(Offset(0, y), Offset(0, y + 6), paint);
      y += 10;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class StepCard extends StatelessWidget {
  final String title;
  final String duration;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final void Function()? onTap;

  const StepCard({
    super.key,
    required this.title,
    required this.duration,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: const Color(0x19273377), blurRadius: 20, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyTxtColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
