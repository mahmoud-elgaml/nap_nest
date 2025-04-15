import 'package:flutter/material.dart';
import 'package:nap_nest/features/onboarding/presentation/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: OnboardingViewBody()));
}
