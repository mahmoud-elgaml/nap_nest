// breathing_timer_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class BreathingTimerView extends StatefulWidget {
  const BreathingTimerView({super.key});
  static const routeName = 'BreathingTimer';
  @override
  State<BreathingTimerView> createState() => _BreathingTimerViewState();
}

class _BreathingTimerViewState extends State<BreathingTimerView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isBreathingIn = true;
  int selectedDuration = 4 * 60; // 4 mins default
  late Timer _countdownTimer;
  int remainingSeconds = 4 * 60;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 7 + 11))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => isBreathingIn = !isBreathingIn);
          _controller.reset();
          _controller.forward();
        }
      });
    _startSession();
  }

  void _startSession() {
    _controller.forward();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingSeconds--;
        if (remainingSeconds <= 0) {
          timer.cancel();
          _controller.stop();
        }
      });
    });
  }

  void _selectDuration(int minutes) {
    setState(() {
      selectedDuration = minutes * 60;
      remainingSeconds = selectedDuration;
    });
    _countdownTimer.cancel();
    _controller.reset();
    _startSession();
  }

  @override
  void dispose() {
    _controller.dispose();
    _countdownTimer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFF74B2E7);
    return Scaffold(
      backgroundColor: const Color(0xFFE5F2FC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              ),
              SizedBox(height: 16.h),
              Text(
                '7-11 Breathing',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final scale =
                          isBreathingIn
                              ? Tween<double>(begin: 1.0, end: 1.2).evaluate(_controller)
                              : Tween<double>(begin: 1.2, end: 1.0).evaluate(_controller);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 220.w,
                            height: 220.w,
                            child: CircularProgressIndicator(
                              value: _controller.value,
                              strokeWidth: 10.w,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation(primaryColor),
                            ),
                          ),
                          Transform.scale(
                            scale: scale,
                            child: Container(
                              width: 140.w,
                              height: 140.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                isBreathingIn ? 'Breathe in' : 'Breathe out',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  _formatTime(remainingSeconds),
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    [3, 4, 5].map((m) {
                      final isSelected = m * 60 == selectedDuration;
                      return GestureDetector(
                        onTap: () => _selectDuration(m),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: isSelected ? primaryColor : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.timer, size: 18, color: Colors.white),
                              SizedBox(width: 8.w),
                              Text(
                                '$m min',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
