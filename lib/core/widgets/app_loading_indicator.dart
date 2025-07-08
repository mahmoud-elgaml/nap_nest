import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nap_nest/core/utils/app_images.dart';

class AppLoading extends StatefulWidget {
  const AppLoading({super.key});

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // دوران أسرع
    )..repeat();

    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800), // Ripple أسرع
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimatedLoader(
      rippleController: _rippleController,
      rotationController: _rotationController,
    );
  }
}

class _AnimatedLoader extends StatelessWidget {
  const _AnimatedLoader({required this.rippleController, required this.rotationController});

  final AnimationController rippleController;
  final AnimationController rotationController;

  Widget _buildRipple(double progress, Color color, double maxSize) {
    final size = maxSize * progress;
    final opacity = (1.0 - progress).clamp(0.0, 1.0);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(opacity * 0.2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> ripple1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: rippleController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    final Animation<double> ripple2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: rippleController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    return AnimatedBuilder(
      animation: Listenable.merge([rippleController, rotationController]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            _buildRipple(ripple1.value, Colors.blueAccent, 160),
            _buildRipple(ripple2.value, Colors.lightBlueAccent, 140),

            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 30, spreadRadius: 10),
                ],
              ),
            ),

            RotationTransition(
              turns: rotationController,
              child: SvgPicture.asset(Assets.imagesAppLogo, width: 80, height: 80),
            ),
          ],
        );
      },
    );
  }
}
