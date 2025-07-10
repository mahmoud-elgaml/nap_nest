import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomIOSPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  CustomIOSPageRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 450),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slide = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          final fade = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(
            position: animation.drive(slide),
            child: FadeTransition(opacity: animation.drive(fade), child: child),
          );
        },
      );
}
