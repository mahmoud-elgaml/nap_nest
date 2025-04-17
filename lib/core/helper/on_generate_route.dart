import 'package:flutter/material.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/auth/presentation/view/forget_password_view.dart';
import 'package:nap_nest/features/auth/presentation/view/login_view.dart';
import 'package:nap_nest/features/auth/presentation/view/register_view.dart';
import 'package:nap_nest/features/auth/presentation/view/verify_code_view.dart';
import 'package:nap_nest/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view1.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view2.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView1.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView1());

    case SplashView2.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView2());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case AuthView.routeName:
      return MaterialPageRoute(builder: (context) => const AuthView());

    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );

    case VerifyCodeView.routeName:
      return MaterialPageRoute(builder: (context) => const VerifyCodeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

// Route<dynamic> onGenerateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case SplashView1.routeName:
//       return MaterialPageRoute<void>(builder: (_) => const SplashView1());

//     case SplashView2.routeName:
//       return MaterialPageRoute<void>(builder: (_) => const SplashView2());

//     case OnBoardingView.routeName:
//       return MaterialPageRoute<void>(builder: (_) => const OnBoardingView());

//     case AuthView.routeName:
//       return MaterialPageRoute<void>(builder: (_) => const AuthView());

//     case RegisterView.routeName:
//       return MaterialPageRoute<void>(builder: (_) => const RegisterView());

//     case LoginView.routeName:
//       return MaterialPageRoute<void>(builder: (_) => const LoginView());

//     default:
//       return MaterialPageRoute<void>(
//         builder:
//             (_) => Scaffold(
//               appBar: AppBar(title: const Text('404')),
//               body: const Center(
//                 child: Text('Page not found!', style: TextStyle(fontSize: 24)),
//               ),
//             ),
//       );
//   }
// }
