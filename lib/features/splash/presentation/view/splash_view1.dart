import 'package:flutter/material.dart';
import 'package:nap_nest/features/splash/presentation/view/widgets/splash_view1_body.dart';

class SplashView1 extends StatelessWidget {
  const SplashView1({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: SplashView1Body()));
}
