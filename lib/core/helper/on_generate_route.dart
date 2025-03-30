import 'package:flutter/material.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view1.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView1.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView1());

    // case OnBoardingView.routeName:
    //   return MaterialPageRoute(builder: (context) => const OnBoardingView());

    // case LoginView.routeName:
    //   return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
