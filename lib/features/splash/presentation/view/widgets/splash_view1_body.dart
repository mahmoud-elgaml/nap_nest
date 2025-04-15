import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view2.dart';
import 'package:svg_flutter/svg.dart';

class SplashView1Body extends StatefulWidget {
  const SplashView1Body({super.key});
  static const String routeName = 'splash1';

  @override
  SplashView1BodyState createState() => SplashView1BodyState();
}

class SplashView1BodyState extends State<SplashView1Body> {
  @override
  @override
  void initState() {
    super.initState();
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.primaryColor,
    body: Center(
      child: SvgPicture.asset(
        'assets/images/app_icon.svg',
        width: 200,
        height: 110.0,
      ),
    ),
  );

  void excuteNavigation() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(SplashView2.routeName);
      }
    });
  }
}
