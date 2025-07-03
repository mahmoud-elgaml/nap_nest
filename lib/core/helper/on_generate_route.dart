import 'package:flutter/material.dart';
import 'package:nap_nest/core/widgets/success_message_view.dart';
import 'package:nap_nest/features/attachDevice/presentation/view/attach_device_view.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/auth/presentation/view/forget_password_view.dart';
import 'package:nap_nest/features/auth/presentation/view/login_view.dart';
import 'package:nap_nest/features/auth/presentation/view/register_view.dart';
import 'package:nap_nest/features/auth/presentation/view/verify_code_view.dart';
import 'package:nap_nest/features/auth/presentation/widgets/set_new_password_body.dart';
import 'package:nap_nest/features/breathing/presentation/view/breathing_details_view.dart';
import 'package:nap_nest/features/breathing/presentation/view/breathing_view.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_details_view_body.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_timer_excercise.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';
import 'package:nap_nest/features/library/presentation/views/article_view.dart';
import 'package:nap_nest/features/library/presentation/views/library_view.dart';
import 'package:nap_nest/features/library/presentation/widgets/articles_view_body.dart';
import 'package:nap_nest/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:nap_nest/features/profile/presentation/views/profile_view.dart';
import 'package:nap_nest/features/profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_result_view.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_view.dart';
import 'package:nap_nest/features/soundtrack/presentation/view/sound_track_view.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view1.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view2.dart';
import 'package:nap_nest/features/userInfo/birthday_view_body.dart';
import 'package:nap_nest/features/userInfo/gender_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:nap_nest/statistics/presentation/views/statistics_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView1.routeName:
      return CupertinoPageRoute(builder: (context) => const SplashView1());

    case SplashView2.routeName:
      return CupertinoPageRoute(builder: (context) => const SplashView2());

    case OnBoardingView.routeName:
      return CupertinoPageRoute(builder: (context) => const OnBoardingView());

    case AuthView.routeName:
      return CupertinoPageRoute(builder: (context) => const AuthView());

    case RegisterView.routeName:
      return CupertinoPageRoute(builder: (context) => const RegisterView());

    case LoginView.routeName:
      return CupertinoPageRoute(builder: (context) => const LoginView());

    case ForgetPasswordView.routeName:
      return CupertinoPageRoute(builder: (context) => const ForgetPasswordView());

    case BirthdayViewBody.routeName:
      return CupertinoPageRoute(builder: (context) => BirthdayViewBody());

    case VerifyCodeView.routeName:
      return CupertinoPageRoute(builder: (context) => const VerifyCodeView());

    case GenderViewBody.routeName:
      return CupertinoPageRoute(builder: (context) => GenderViewBody());

    case PsqiView.routeName:
      return CupertinoPageRoute(builder: (context) => const PsqiView());

    case PsqiResultView.routeName:
      return CupertinoPageRoute(builder: (context) => const PsqiResultView());

    case SuccessMessage.routeName:
      return CupertinoPageRoute(builder: (context) => const SuccessMessage());

    case SetNewPasswordViewBody.routeName:
      return CupertinoPageRoute(builder: (context) => const SetNewPasswordViewBody());

    case HomeView.routeName:
      return CupertinoPageRoute(builder: (context) => const HomeView());

    case SoundTrackView.routeName:
      return CupertinoPageRoute(builder: (context) => const SoundTrackView());

    case AttachDeviceView.routeName:
      return CupertinoPageRoute(builder: (context) => const AttachDeviceView());

    case BreathingView.routeName:
      return CupertinoPageRoute(builder: (context) => const BreathingView());

    case StatisticsView.routeName:
      return CupertinoPageRoute(builder: (context) => const StatisticsView());


    case BreathingDetailsView.routeName:
      final args = settings.arguments as Map<String, String>;
      return CupertinoPageRoute(
        builder:
            (context) => BreathingDetailsViewBody(
              title: args['title'] ?? '',
              description: args['description'] ?? '',
              duration: args['duration'] ?? '',
            ),
      );

    case ArticleView.routeName:
      return CupertinoPageRoute(builder: (context) => const ArticleView());

    case LibraryView.routeName:
      return CupertinoPageRoute(builder: (context) => const LibraryView());

    case ArticlesViewBody.routeName:
            return CupertinoPageRoute(builder: (context) => const ArticlesViewBody());

    case BreathingTimerView.routeName:
      return CupertinoPageRoute(builder: (context) =>  BreathingTimerView());

    case ProfileView.routeName:
      return CupertinoPageRoute(builder: (context) => ProfileView());

    case EditProfileView.routeName:
                return CupertinoPageRoute(builder: (context) => EditProfileView());


    default:
      return CupertinoPageRoute(builder: (context) => const Scaffold());
  }
}
