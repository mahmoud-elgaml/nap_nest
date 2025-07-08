import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
class ThoughtFlipScreen extends StatefulWidget {
  final String selectedThought;
  const ThoughtFlipScreen({super.key, required this.selectedThought});

  @override
  State<ThoughtFlipScreen> createState() => _ThoughtFlipScreenState();
}
class _ThoughtFlipScreenState extends State<ThoughtFlipScreen> with SingleTickerProviderStateMixin {
  bool isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;


final Map<String, String> flippedThoughtMap = {
    'Many people struggle with sleep at times. I’m not alone, and I can learn to improve my sleep.':
        'Struggles with sleep are common, and learning helps me grow.',
    'If I don’t get 8 hours of sleep, I’ll be a wreck tomorrow.':
        'I can still function with less sleep. My body is resilient and will adapt.',
    'Everyone else sleeps perfectly; I must be doing something wrong.':
        'Everyone has sleep challenges. I’m not alone and I’m doing my best.',
  };

  final Map<String, String> descriptionMap = {
    'Many people struggle with sleep at times. I’m not alone, and I can learn to improve my sleep.':
        'Tap the card to reflect on your thought.',
    'If I don’t get 8 hours of sleep, I’ll be a wreck tomorrow.':
        'Reflect and reveal a new perspective on this thought.',
    'Everyone else sleeps perfectly; I must be doing something wrong.':
        'Challenge this thought to find a kinder truth.',
  };

  final String flippedDescription = 'You can like thoughts and check it later in the "Favorites"';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    _animation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _flipCard() {
    if (isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String flippedThought = flippedThoughtMap[widget.selectedThought] ?? '...';
    final String preFlipDesc = descriptionMap[widget.selectedThought] ?? '';

    return Scaffold(
      body: Container(
        width: 428.w,
        height: 926.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFBFD7F2),
              const Color(0xFF9F8CCC).withOpacity(0.3),
              const Color(0xFFBFD7F2),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 100.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'Night Notions',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Text('My Thoughts', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  isFlipped ? flippedDescription : preFlipDesc,
                  style: TextStyle(
                    color: AppColors.darkGreyTxtColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 140.h),
              Center(
                child: GestureDetector(
                  onTap: _flipCard,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      final isUnder = (_animation.value > pi / 2);
                      final displayText = isUnder ? flippedThought : widget.selectedThought;
                      final rotate = isUnder ? _animation.value - pi : _animation.value;
                      return Transform(
                        transform: Matrix4.rotationY(rotate),
                        alignment: Alignment.center,
                        child: Container(
                          width: 320.w,
                          height: 220.h,
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 30.r)],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                displayText,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(height: 20.h),
                              Icon(
                                isUnder ? Icons.favorite : Icons.sync_rounded,
                                size: 28.sp,
                                color: isUnder ? Colors.pinkAccent : Colors.deepPurple,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: GestureDetector(
                  onTap: _flipCard,
                  child: Container(
                    width: 185.w,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                    decoration: ShapeDecoration(
                      color: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
                    ),
                    child: Center(
                      child: Text(
                        isFlipped ? 'Done' : 'Flip',
                        style: TextStyle(
                          color: const Color(0xFFF9F9F9),
                          fontSize: 15.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Center(
                child: Text(
                  isFlipped
                      ? 'Tap the heart to acknowledge your positive thought.'
                      : 'Tap the card to see the flipped positive thought.',
                  style: TextStyle(
                    color: AppColors.darkGreyTxtColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}




