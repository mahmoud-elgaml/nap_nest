import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// class AnimatedSuccessIcon extends StatefulWidget {
//   const AnimatedSuccessIcon({super.key});

//   @override
//   State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
// }

// class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scalePulse;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
//       ..repeat(reverse: true);

//     _scalePulse = Tween<double>(
//       begin: 1.0,
//       end: 1.07,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         AnimatedBuilder(
//           animation: _scalePulse,
//           builder: (context, child) {
//             return Container(
//               width: 150 * _scalePulse.value,
//               height: 150 * _scalePulse.value,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color(0xFFE4EEF9),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color.fromRGBO(96, 165, 250, 0.35),
//                     blurRadius: 50 * _scalePulse.value,
//                     spreadRadius: 20 * _scalePulse.value,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),

//         ScaleTransition(
//           scale: Tween<double>(begin: 0, end: 1).animate(
//             CurvedAnimation(
//               parent: _controller,
//               curve: const Interval(0, 0.4, curve: Curves.elasticOut),
//             ),
//           ),
//           child: ScaleTransition(
//             scale: _scalePulse,
//             child: Container(
//               width: 115,
//               height: 115,
//               decoration: const BoxDecoration(color: Color(0xFF60A5FA), shape: BoxShape.circle),
//               child: const Icon(Icons.check_rounded, size: 70, color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


// i like this >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class AnimatedSuccessIcon extends StatefulWidget {
  const AnimatedSuccessIcon({super.key});

  @override
  State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
}

class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scalePop;
  late Animation<double> _glowPulse;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();
    _scalePop = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.3).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.3, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_controller);
    _glowPulse = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.3, end: 0.7).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.7, end: 0.3).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _glowColorWithAlpha(double alpha) {
    return const Color(0xFF60A5FA).withAlpha((alpha * 255).toInt());
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glowColor = _glowColorWithAlpha(_glowPulse.value);
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 150.w * _scalePop.value,
              height: 150.h * _scalePop.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE4EEF9),
                boxShadow: [
                  BoxShadow(
                    color: glowColor,
                    blurRadius: 30 * _scalePop.value,
                    spreadRadius: 10 * _scalePop.value,
                  ),
                ],
              ),
            ),

            Transform.scale(
              scale: _scalePop.value,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF60A5FA,
                  ), 
                  shape: BoxShape.circle,
                  //
                  ),
                child: const Icon(Icons.check_rounded, size: 70, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

// class AnimatedSuccessIcon extends StatefulWidget {
//   const AnimatedSuccessIcon({super.key});

//   @override
//   State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
// }

// class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _scaleAnim;
//   late final Animation<double> _pulseAnim;
//   late final Animation<double> _fadeIn;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

//     _scaleAnim = Tween<double>(begin: 0.0, end: 1.0)
//         .chain(CurveTween(curve: Curves.elasticOut))
//         .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6)));

//     _pulseAnim = Tween<double>(begin: 1.0, end: 1.05).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
//       ),
//     );

//     _fadeIn = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.3, 1.0)));

//     _controller.forward();
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _controller.repeat(reverse: true);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, __) {
//         return Opacity(
//           opacity: _fadeIn.value,
//           child: Transform.scale(
//             scale: _scaleAnim.value * _pulseAnim.value,
//             child: Container(
//               width: 115,
//               height: 115,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFF3B82F6),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromRGBO(59, 130, 246, 0.4),
//                     blurRadius: 25,
//                     spreadRadius: 5,
//                   ),
//                 ],
//               ),
//               child: const Icon(Icons.check_rounded, size: 70, color: Colors.white),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class AnimatedSuccessIcon extends StatefulWidget {
//   const AnimatedSuccessIcon({super.key});

//   @override
//   State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
// }

// class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon> with TickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _iconScale;
//   late final Animation<double> _glowScale;
//   late final Animation<double> _glowOpacity;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200));

//     _iconScale = Tween<double>(begin: 0.0, end: 1.0)
//         .chain(CurveTween(curve: Curves.elasticOut))
//         .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.1, 0.6)));

//     _glowScale = Tween<double>(begin: 0.0, end: 2.2)
//         .chain(CurveTween(curve: Curves.easeOutCubic))
//         .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6)));

//     _glowOpacity = Tween<double>(
//       begin: 0.4,
//       end: 0.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6)));

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Widget _buildGlowCircle() {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, __) {
//         return Opacity(
//           opacity: _glowOpacity.value,
//           child: Transform.scale(
//             scale: _glowScale.value,
//             child: Container(
//               width: 60,
//               height: 60,
//               decoration: const BoxDecoration(color: Color(0xFF3B82F6), shape: BoxShape.circle),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildMainIcon() {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, __) {
//         return Transform.scale(
//           scale: _iconScale.value,
//           child: Container(
//             width: 115,
//             height: 115,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFF3B82F6),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromRGBO(59, 130, 246, 0.4),
//                   blurRadius: 20,
//                   spreadRadius: 6,
//                 ),
//               ],
//             ),
//             child: const Icon(Icons.check_rounded, size: 70, color: Colors.white),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(alignment: Alignment.center, children: [_buildGlowCircle(), _buildMainIcon()]);
//   }
// }
