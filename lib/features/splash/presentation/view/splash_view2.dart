import 'package:flutter/material.dart';
import 'package:nap_nest/features/splash/presentation/widgets/splash_view2_body.dart';

class SplashView2 extends StatelessWidget {
  const SplashView2({super.key});

  static const routeName = 'splash2';

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: SplashView2Body()));
}
