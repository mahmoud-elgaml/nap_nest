import 'package:flutter/material.dart';
import 'package:nap_nest/core/widgets/success_message_view.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/auth/presentation/view/forget_password_view.dart';
import 'package:nap_nest/features/auth/presentation/view/login_view.dart';
import 'package:nap_nest/features/auth/presentation/view/register_view.dart';
import 'package:nap_nest/features/auth/presentation/view/verify_code_view.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';
import 'package:nap_nest/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_view.dart';
import 'package:nap_nest/features/soundtrack/presentation/view/sound_track_view.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view1.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view2.dart';
import 'package:nap_nest/features/userInfo/birthday_view_body.dart';
import 'package:nap_nest/features/userInfo/gender_view_body.dart';

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

    case BirthdayViewBody.routeName:
      return MaterialPageRoute(builder: (context) => BirthdayViewBody());

    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordView());

    case VerifyCodeView.routeName:
      return MaterialPageRoute(builder: (context) => const VerifyCodeView());

    case GenderViewBody.routeName:
      return MaterialPageRoute(builder: (context) => GenderViewBody());

    case PsqiView.routeName:
      return MaterialPageRoute(builder: (context) => const PsqiView());

    case SuccessMessage.routeName:
      return MaterialPageRoute(builder: (context) => const SuccessMessage());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case SoundTrackView.routeName:
      return MaterialPageRoute(builder: (context) => const SoundTrackView());

    // case MainLayout.routeName:
    //   return MaterialPageRoute(builder: (context) => const MainLayout());



    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
