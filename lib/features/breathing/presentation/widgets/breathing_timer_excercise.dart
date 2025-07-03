// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BreathingTimerView extends StatefulWidget {
//   const BreathingTimerView({super.key});
//   static const routeName = 'breathing_timer_view';

//   @override
//   State<BreathingTimerView> createState() => _BreathingTimerViewState();
// }

// class _BreathingTimerViewState extends State<BreathingTimerView> with TickerProviderStateMixin {
//   late AnimationController _breathingController;
//   late AnimationController _rotationController;
//   bool isBreathingIn = true;
//   bool isStarted = false;

//   int selectedDuration = 4 * 60;
//   int remainingSeconds = 4 * 60;
//   Timer? _countdownTimer;

//   final Color primaryColor = const Color(0xFF74B2E7);
//   final double circleSize = 140.w;
//   final double markerAngle = 330 * pi / 180;

//   @override
//   void initState() {
//     super.initState();

//     _breathingController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 7 + 11),
//     )..addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() => isBreathingIn = !isBreathingIn);
//         _breathingController.reset();
//         _breathingController.forward();
//       }
//     });

//     _rotationController = AnimationController(vsync: this, duration: const Duration(seconds: 18))
//       ..addListener(_checkThreshold);
//   }

//   void _checkThreshold() {
//     final angle = _rotationController.value * 2 * pi;
//     if ((angle - markerAngle).abs() < 0.05) {
//       setState(() => isBreathingIn = !isBreathingIn);
//     }
//   }

//   void _startSession() {
//     setState(() => isStarted = true);
//     _breathingController.forward();
//     _rotationController.repeat();

//     _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (mounted) {
//         setState(() {
//           remainingSeconds--;
//           if (remainingSeconds <= 0) {
//             timer.cancel();
//             _breathingController.stop();
//             _rotationController.stop();
//           }
//         });
//       }
//     });
//   }

//   void _selectDuration(int minutes) {
//     setState(() {
//       selectedDuration = minutes * 60;
//       remainingSeconds = selectedDuration;
//     });
//     _countdownTimer?.cancel();
//     _breathingController.reset();
//     _rotationController.reset();
//     setState(() => isStarted = false);
//   }

//   @override
//   void dispose() {
//     _breathingController.dispose();
//     _rotationController.dispose();
//     _countdownTimer?.cancel();
//     super.dispose();
//   }

//   String _formatTime(int seconds) {
//     final m = (seconds ~/ 60).toString().padLeft(2, '0');
//     final s = (seconds % 60).toString().padLeft(2, '0');
//     return '$m:$s';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE5F2FC),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20.h),
//               GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
//               ),
//               SizedBox(height: 16.h),
//               Text(
//                 '7-11 Breathing',
//                 style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 30.h),
//               Expanded(
//                 child: Center(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ..._buildGradientCircles(),
//                       _buildMarker(),
//                       _buildRotatingIndicator(),
//                       _buildCenterCircle(),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               Center(
//                 child: Text(
//                   _formatTime(remainingSeconds),
//                   style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 24.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children:
//                     [3, 4, 5].map((m) {
//                       final isSelected = m * 60 == selectedDuration;
//                       return GestureDetector(
//                         onTap: () => _selectDuration(m),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//                           decoration: BoxDecoration(
//                             color: isSelected ? primaryColor : Colors.grey.shade300,
//                             borderRadius: BorderRadius.circular(16.r),
//                           ),
//                           child: Row(
//                             children: [
//                               const Icon(Icons.timer, size: 18, color: Colors.white),
//                               SizedBox(width: 8.w),
//                               Text(
//                                 '$m min',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//               ),
//               SizedBox(height: 30.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCenterCircle() {
//     return GestureDetector(
//       onTap: () {
//         if (!isStarted) _startSession();
//       },
//       child: AnimatedBuilder(
//         animation: _breathingController,
//         builder: (context, child) {
//           final scale = Tween<double>(
//             begin: 1.0,
//             end: 1.2,
//           ).animate(CurvedAnimation(parent: _breathingController, curve: Curves.easeInOut));

//           return Transform.scale(
//             scale: isStarted ? scale.value : 1.0,
//             child: Container(
//               width: circleSize,
//               height: circleSize,
//               decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
//               alignment: Alignment.center,
//               child: Text(
//                 isBreathingIn ? 'Breathe in' : 'Breathe out',
//                 style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildRotatingIndicator() {
//     return isStarted
//         ? AnimatedBuilder(
//           animation: _rotationController,
//           builder: (_, __) {
//             final angle = _rotationController.value * 2 * pi;
//             final offset = Offset(
//               (circleSize + 60) / 2 * cos(angle),
//               (circleSize + 60) / 2 * sin(angle),
//             );
//             return Transform.translate(
//               offset: offset,
//               child: Container(
//                 width: 16.w,
//                 height: 16.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey, width: 2),
//                 ),
//               ),
//             );
//           },
//         )
//         : const SizedBox.shrink();
//   }

//   Widget _buildMarker() {
//     final offset = Offset(
//       (circleSize + 60) / 2 * cos(markerAngle),
//       (circleSize + 60) / 2 * sin(markerAngle),
//     );
//     return Transform.translate(
//       offset: offset,
//       child: Container(
//         width: 12.w,
//         height: 12.w,
//         decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//       ),
//     );
//   }

//   List<Widget> _buildGradientCircles() {
//     return List.generate(3, (i) {
//       return Container(
//         width: (circleSize + 60 + i * 30).w,
//         height: (circleSize + 60 + i * 30).w,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: primaryColor.withOpacity(0.1 * (3 - i)),
//         ),
//       );
//     });
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';

class BreathingTimerView extends StatefulWidget {
  @override
  _BreathingTimerViewState createState() => _BreathingTimerViewState();
    static const routeName = 'breathing_timer_view';

}

class _BreathingTimerViewState extends State<BreathingTimerView> with SingleTickerProviderStateMixin {
  late AnimationController _cycleController;
  Timer? _countdownTimer;
  int _remainingSeconds = 0;

  // Breath settings
  final int inhaleSec = 7;
  final int exhaleSec = 11;
  late int _sessionMin = 4;

  @override
  void initState() {
    super.initState();

    // 1 full cycle = inhale + exhale
    final cycleDuration = Duration(seconds: inhaleSec + exhaleSec);

    _cycleController = AnimationController(vsync: this, duration: cycleDuration);

    _startSession();
  }

  void _startSession() {
    // restart breathing animation
    _cycleController
      ..reset()
      ..repeat();

    // restart countdown
    _countdownTimer?.cancel();
    _remainingSeconds = _sessionMin * 60;
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        _cycleController.stop();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  String get _timerText {
    final m = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  String get _breathPhase {
    final t = _cycleController.value * (inhaleSec + exhaleSec); // 0 → total cycle seconds
    return t < inhaleSec ? 'Breathe in' : 'Breathe out';
  }

  double get _phaseProgress {
    final t = _cycleController.value * (inhaleSec + exhaleSec);
    if (t < inhaleSec) {
      // inhale phase
      return t / inhaleSec;
    } else {
      // exhale phase
      return (t - inhaleSec) / exhaleSec;
    }
  }

  @override
  void dispose() {
    _cycleController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  Widget _buildDurationButton(int minutes) {
    final selected = _sessionMin == minutes;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: selected ? Colors.blue : Colors.grey[400]),
        onPressed: () {
          setState(() => _sessionMin = minutes);
          _startSession();
        },
        child: Text('$minutes min'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('7-11 Breathing'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: AnimatedBuilder(
                animation: _cycleController,
                builder:
                    (_, __) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: CircularProgressIndicator(
                                value: _phaseProgress,
                                strokeWidth: 12,
                              ),
                            ),
                            Text(
                              _breathPhase,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Text(_timerText, style: TextStyle(fontSize: 32)),
                      ],
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildDurationButton(3), _buildDurationButton(4), _buildDurationButton(5)],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
