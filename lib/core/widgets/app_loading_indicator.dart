import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nap_nest/core/utils/app_images.dart';

// class CustomAppLoading extends StatefulWidget {
//   const CustomAppLoading({super.key});

//   @override
//   State<CustomAppLoading> createState() => _CustomAppLoadingState();
// }

// class _CustomAppLoadingState extends State<CustomAppLoading> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late AnimationController _rippleController;

//   @override
//   void initState() {
//     super.initState();

//     _rotationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 4), // دوران أسرع
//     )..repeat();

//     _rippleController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1800), // Ripple أسرع
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _rotationController.dispose();
//     _rippleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _AnimatedLoader(
//         rippleController: _rippleController,
//         rotationController: _rotationController,
//       ),
//     );
//   }
// }

// class _AnimatedLoader extends StatelessWidget {
//   const _AnimatedLoader({required this.rippleController, required this.rotationController});

//   final AnimationController rippleController;
//   final AnimationController rotationController;

//   Widget _buildRipple(double progress, Color color, double maxSize) {
//     final size = maxSize * progress;
//     final opacity = (1.0 - progress).clamp(0.0, 1.0);
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(opacity * 0.2)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> ripple1 = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: rippleController,
//         curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
//       ),
//     );

//     final Animation<double> ripple2 = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: rippleController,
//         curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
//       ),
//     );

//     return AnimatedBuilder(
//       animation: Listenable.merge([rippleController, rotationController]),
//       builder: (context, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             _buildRipple(ripple1.value, Colors.blueAccent, 160),
//             _buildRipple(ripple2.value, Colors.lightBlueAccent, 140),

//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 30, spreadRadius: 10),
//                 ],
//               ),
//             ),

//             RotationTransition(
//               turns: rotationController,
//               child: SvgPicture.asset(Assets.imagesAppLogo, width: 80, height: 80),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


// class CustomAppLoading extends StatefulWidget {
//   const CustomAppLoading({super.key});

//   @override
//   State<CustomAppLoading> createState() => _CustomAppLoadingState();
// }

// class _CustomAppLoadingState extends State<CustomAppLoading> with TickerProviderStateMixin {
//   late AnimationController _rippleController;
//   late AnimationController _pulseController;

//   @override
//   void initState() {
//     super.initState();

//     _rippleController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1800),
//     )..repeat();

//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//       lowerBound: 0.95,
//       upperBound: 1.05,
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _rippleController.dispose();
//     _pulseController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _AnimatedLoader(
//         rippleController: _rippleController,
//         pulseController: _pulseController,
//       ),
//     );
//   }
// }

// class _AnimatedLoader extends StatelessWidget {
//   const _AnimatedLoader({required this.rippleController, required this.pulseController});

//   final AnimationController rippleController;
//   final AnimationController pulseController;

//   Widget _buildRipple(double progress, Color color, double maxSize) {
//     final size = maxSize * progress;
//     final opacity = (1.0 - progress).clamp(0.0, 1.0);
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(opacity * 0.25)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ripple1 = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: rippleController,
//         curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
//       ),
//     );

//     final ripple2 = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: rippleController,
//         curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
//       ),
//     );

//     return AnimatedBuilder(
//       animation: Listenable.merge([rippleController, pulseController]),
//       builder: (context, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             _buildRipple(ripple1.value, Colors.blueAccent, 160),
//             _buildRipple(ripple2.value, Colors.lightBlueAccent, 140),
//             ScaleTransition(
//               scale: pulseController,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.blue.withOpacity(0.25),
//                       blurRadius: 30,
//                       spreadRadius: 10,
//                     ),
//                   ],
//                 ),
//                 child: SvgPicture.asset(Assets.imagesAppLogo, width: 80, height: 80),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class CustomAppLoading extends StatefulWidget {
  const CustomAppLoading({super.key});

  @override
  State<CustomAppLoading> createState() => _CustomAppLoadingState();
}

class _CustomAppLoadingState extends State<CustomAppLoading> with TickerProviderStateMixin {
  late AnimationController _breathingController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _breathingController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _breathingController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _breathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.25),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SvgPicture.asset(Assets.imagesAppLogo, width: 70, height: 70),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


