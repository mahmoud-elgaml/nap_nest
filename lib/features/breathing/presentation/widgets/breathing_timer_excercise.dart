import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class BreathingTimerView extends StatefulWidget {
  static const routeName = 'breathing_timer_view';

  @override
  _BreathingTimerViewState createState() => _BreathingTimerViewState();
}

class _BreathingTimerViewState extends State<BreathingTimerView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  final int inhaleSec = 7;
  final int exhaleSec = 11;
  int totalCycles = 6;

  int currentCycle = 0;
  bool isInhale = true;
  bool hasStarted = false;

  final List<double> _quarterAngles = [0.0, pi / 2, pi, 3 * pi / 2];
  double _lastCheckedAngle = -1;

  @override
  void initState() {
    super.initState();
    final totalDuration = Duration(seconds: inhaleSec + exhaleSec);

    _controller = AnimationController(vsync: this, duration: totalDuration)..addListener(() {
      setState(() {
        _checkQuarterRotation();
      });
    });

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.7, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
        weight: inhaleSec.toDouble(),
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.7).chain(CurveTween(curve: Curves.easeInOut)),
        weight: exhaleSec.toDouble(),
      ),
    ]).animate(_controller);
  }

  void _startBreathing() {
    if (hasStarted) return;
    setState(() {
      hasStarted = true;
    });
    _controller.repeat();

    Timer.periodic(Duration(seconds: inhaleSec + exhaleSec), (timer) {
      if (currentCycle >= totalCycles - 1) {
        _controller.stop();
        timer.cancel();
      } else {
        currentCycle++;
      }
    });
  }

  void _checkQuarterRotation() {
    double angle = (2 * pi * _controller.value) % (2 * pi);

    for (var q in _quarterAngles) {
      if (_isCloseTo(angle, q, 0.05) && !_isCloseTo(_lastCheckedAngle, q, 0.05)) {
        isInhale = !isInhale;
        _lastCheckedAngle = q;
        break;
      }
    }
  }

  bool _isCloseTo(double a, double b, double tolerance) => (a - b).abs() < tolerance;

  Offset get movingDotOffset {
    double angle = 2 * pi * _controller.value - pi / 2;
    double radius = 150.r;
    return Offset(cos(angle) * radius, sin(angle) * radius);
  }

  Widget _buildCycleSelector() {
    List<int> options = [3, 6, 9];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          options.map((value) {
            bool isSelected = value == totalCycles;
            return GestureDetector(
              onTap: () {
                setState(() {
                  totalCycles = value;
                  currentCycle = 0;
                  hasStarted = false;
                  _controller.reset();
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blueAccent : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Text(
                  '$value Cycles',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.blueAccent,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder:
          (_, __) => Scaffold(
              body: Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.0, -0.3),
          radius: 1.2,
          colors: [
            AppColors.primaryColor,
            Color(0xFF0D1B2A),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 16.w,
            top: 40.h,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close, color: Colors.white, size: 30.sp),
            ),
          ),
            // body: Stack(
            //   children: [
            //     Positioned(
            //       right: 16.w,
            //       top: 40.h,
            //       child: GestureDetector(
            //         onTap: () => Navigator.pop(context),
            //         child: Icon(Icons.close, color: Colors.white, size: 30.sp),
            //       ),
            //     ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 300.r,
                            height: 300.r,
                            child: CustomPaint(painter: DashedCirclePainter()),
                          ),
                          Transform.translate(
                            offset: movingDotOffset,
                            child: Container(
                              width: 20.r,
                              height: 20.r,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _startBreathing,
                            child: Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Container(
                                width: 160.r,
                                height: 160.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Colors.blue, Colors.blueAccent],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    isInhale ? 'Breathe Out' :  'Breathe In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        '${totalCycles - currentCycle} cycles left',
                        style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                      ),
                      SizedBox(height: 16.h),
                      _buildCycleSelector(),
                    ],
                  ),
                ),
              ],
            ),
                ),      ),
    );
  }
}

// Painter for Dashed Circle with markers
class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.blue.withOpacity(0.5)
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

    final radius = size.width / 2;
    const dashWidth = 6;
    const dashSpace = 6;
    double angle = 0;

    while (angle < 2 * pi) {
      final x1 = radius + radius * cos(angle);
      final y1 = radius + radius * sin(angle);
      final x2 = radius + radius * cos(angle + dashWidth / radius);
      final y2 = radius + radius * sin(angle + dashWidth / radius);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
      angle += (dashWidth + dashSpace) / radius;
    }

    final markerPaint =
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 6;

    for (var markAngle in [0.0, pi]) {
      final x = radius + radius * cos(markAngle);
      final y = radius + radius * sin(markAngle);
      canvas.drawLine(Offset(x, y - 10), Offset(x, y + 10), markerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
