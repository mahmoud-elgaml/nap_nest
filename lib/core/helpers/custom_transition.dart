import 'package:flutter/material.dart';

class CustomPageTransitionBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  CustomPageTransitionBuilder({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(position: animation.drive(tween), child: child);
        },
      );
}
