import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nap_nest/constants.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';
import 'package:nap_nest/features/onboarding/presentation/views/on_boarding_view.dart';

class SplashView2Body extends StatefulWidget {
  const SplashView2Body({super.key});

  @override
  SplashView2BodyState createState() => SplashView2BodyState();
}

class SplashView2BodyState extends State<SplashView2Body> {
  @override
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(child: Image.asset(Assets.imagesAppIcon, width: 200)),
  );

  // void executeNavigation() {
  //   bool isOnBoardingSeen = Prefs.getBool(kIsOnBoardingSeen);
  //   Future.delayed(const Duration(milliseconds: 1500), () {
  //     if (isOnBoardingSeen) {
  //       Navigator.pushReplacementNamed(context, AuthView.routeName);
  //     } else {
  //       Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  //     }
  //   });
  // }

void executeNavigation() async {
  bool isOnBoardingSeen = Prefs.getBool(kIsOnBoardingSeen);
  bool isRegistered = Prefs.getBool('isRegistered');

  Future.delayed(const Duration(milliseconds: 1500), () {
    if (!isOnBoardingSeen) {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    } else if (!isRegistered) {
      Navigator.pushReplacementNamed(context, AuthView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    }
  });
}
}
