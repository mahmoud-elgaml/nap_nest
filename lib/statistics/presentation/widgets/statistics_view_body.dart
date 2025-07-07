import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  final List<FlSpot> _spots = const [
    FlSpot(0, 3),
    FlSpot(1, 1),
    FlSpot(2, 4),
    FlSpot(3, 2),
    FlSpot(4, 5),
    FlSpot(5, 1),
    FlSpot(6, 4),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Statistics', style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 6.h),
                Text(
                  'Track your weekly sleep performance, discover insights, and improve your rest quality',
                  style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Text(
              'YOUR SLEEP CYCLE',
              style: TextStyle(
                color: const Color(0xff111111),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            _buildMainCircularIndicator(),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SleepStatIndicator(
                  percent: 0.43,
                  textPercent: '43%',
                  label: 'Total Sleep Time',
                  color: AppColors.secondaryColor2,
                ),
                SleepStatIndicator(
                  percent: 0.40,
                  textPercent: '40%',
                  label: 'Wake After Sleep',
                  color: AppColors.primaryColor,
                ),
                SleepStatIndicator(
                  percent: 0.17,
                  textPercent: '17%',
                  label: 'Sleep Onset Latency',
                  color: Color(0xffE7A786),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            SleepChart(spots: _spots),
            SizedBox(height: 28.h),
            const InfoRow(
              leftTitle: 'Cycle Begin',
              leftValue: '11.15 PM',
              rightTitle: 'Sleep Span',
              rightValue: '8:04',
            ),
            SizedBox(height: 16.h),
            const InfoRow(
              leftTitle: 'Cycle Finish',
              leftValue: '8.19 PM',
              rightTitle: 'Summary',
              rightValue: 'Average',
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCircularIndicator() {
    return CircularPercentIndicator(
      radius: 100.r,
      lineWidth: 12.r,
      percent: 0.9,
      animation: true,
      center: Text(
        '90%',
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xff111111),
        ),
      ),
      footer: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Text(
          'Sleep Efficiency',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGreyTxtColor,
          ),
        ),
      ),
      progressColor: AppColors.primaryColor,
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

class SleepStatIndicator extends StatelessWidget {
  final double percent;
  final String textPercent;
  final String label;
  final Color color;

  const SleepStatIndicator({
    super.key,
    required this.percent,
    required this.textPercent,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 35.r,
          lineWidth: 6.r,
          percent: percent,
          animation: true,
          center: Text(
            textPercent,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: const Color(0xff111111),
            ),
          ),
          progressColor: color,
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 80.w,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.5.sp, color: AppColors.darkGreyTxtColor,fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class SleepChart extends StatelessWidget {
  final List<FlSpot> spots;

  const SleepChart({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 10,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.grey.shade300)),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, _) {
                  const days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
                  return Text(
                    days[value.toInt()],
                    style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500, color: AppColors.darkGreyTxtColor),
                  );
                },
                reservedSize: 32,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget:
                    (value, _) => Text(
                      '${value.toInt()}h',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500, color: AppColors.darkGreyTxtColor),
                    ),
                reservedSize: 32,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 4,
              color: AppColors.secondaryColor,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.secondaryColor.withOpacity(0.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String leftTitle;
  final String leftValue;
  final String rightTitle;
  final String rightValue;

  const InfoRow({
    super.key,
    required this.leftTitle,
    required this.leftValue,
    required this.rightTitle,
    required this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildColumn(leftTitle, leftValue), _buildColumn(rightTitle, rightValue)],
    );
  }

  Widget _buildColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold, color: const Color(0xff111111),),),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyTxtColor,
          ),
        ),
      ],
    );
  }
}
