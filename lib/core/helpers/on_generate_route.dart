import 'package:flutter/material.dart';
import 'package:nap_nest/core/helpers/custom_transition.dart';
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
import 'package:nap_nest/features/myPlan/presentation/views/analyze_thoghts_view.dart';
import 'package:nap_nest/features/myPlan/presentation/views/my_plan_view.dart';
import 'package:nap_nest/features/nestTime/presentation/views/nest_time_view.dart';
import 'package:nap_nest/features/nestTime/presentation/widgets/alarm_setting_view.dart';
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
import 'package:nap_nest/statistics/presentation/views/statistics_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView1.routeName:
      return CustomIOSPageRoute(page: const SplashView1());
    case SplashView2.routeName:
      return CustomIOSPageRoute(page: const SplashView2());
    case OnBoardingView.routeName:
      return CustomIOSPageRoute(page: const OnBoardingView());
    case AuthView.routeName:
      return CustomIOSPageRoute(page: const AuthView());
    case RegisterView.routeName:
      return CustomIOSPageRoute(page: const RegisterView());
    case LoginView.routeName:
      return CustomIOSPageRoute(page: const LoginView());
    case ForgetPasswordView.routeName:
      return CustomIOSPageRoute(page: const ForgetPasswordView());
    case BirthdayViewBody.routeName:
      return CustomIOSPageRoute(page: BirthdayViewBody());
    case VerifyCodeView.routeName:
      return CustomIOSPageRoute(page: const VerifyCodeView());
    case GenderViewBody.routeName:
      return CustomIOSPageRoute(page: GenderViewBody());
    case PsqiView.routeName:
      return CustomIOSPageRoute(page: const PsqiView());
    case PsqiResultView.routeName:
      final result = settings.arguments as Map<String, dynamic>;
      return CustomIOSPageRoute(page: PsqiResultView(result: result));
    case SuccessMessage.routeName:
      return CustomIOSPageRoute(page: const SuccessMessage());
    case SetNewPasswordViewBody.routeName:
      return CustomIOSPageRoute(page: const SetNewPasswordViewBody());
    case HomeView.routeName:
      return CustomIOSPageRoute(page: const HomeView());
    case SoundTrackView.routeName:
      return CustomIOSPageRoute(page: const SoundTrackView());
    case AttachDeviceView.routeName:
      return CustomIOSPageRoute(page: const AttachDeviceView());
    case BreathingView.routeName:
      return CustomIOSPageRoute(page: const BreathingView());
    case StatisticsView.routeName:
      return CustomIOSPageRoute(page: const StatisticsView());
    case BreathingDetailsView.routeName:
      final args = settings.arguments as Map<String, String>;
      return CustomIOSPageRoute(
        page: BreathingDetailsViewBody(
          title: args['title'] ?? '',
          description: args['description'] ?? '',
          duration: args['duration'] ?? '',
        ),
      );
    case ArticleView.routeName:
      return CustomIOSPageRoute(page: const ArticleView());
    case LibraryView.routeName:
      return CustomIOSPageRoute(page: const LibraryView());
    case ArticlesViewBody.routeName:
      return CustomIOSPageRoute(page: const ArticlesViewBody());
    case BreathingTimerView.routeName:
      return CustomIOSPageRoute(page: BreathingTimerView());
    case ProfileView.routeName:
      return CustomIOSPageRoute(page: ProfileView());
    case EditProfileView.routeName:
      return CustomIOSPageRoute(page: EditProfileView());
    case MyPlanView.routeName:
      return CustomIOSPageRoute(page: MyPlanView());
    case AnalyzeThoghtsView.routeName:
      return CustomIOSPageRoute(page: AnalyzeThoghtsView());
    case NestTimeView.routeName:
      return CustomIOSPageRoute(page: NestTimeView());
    case AlarmView.routeName:
      return CustomIOSPageRoute(page: AlarmView());
    default:
      return CustomIOSPageRoute(page: const Scaffold());
  }
}
