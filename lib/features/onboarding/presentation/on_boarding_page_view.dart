import 'package:flutter/material.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/onboarding/presentation/widgets/page_view_item.dart.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context) => PageView(
    controller: pageController,
    children: [
      PageViewItem(
        title: 'Welcome to ',
        title2: 'NAPNEST',
        image: AppImages.imagesOnboarding1,

        description:
            'Hi there! We’re so glad you’re here. Let’s work together to improve your sleep, boost your energy, and help you feel your best every day. Sweet dreams start now!',
      ),
      PageViewItem(
        image: AppImages.imagesOnboarding2,
        title: 'Your Sleep, Your Way',

        description:
            'Begin your journey with a quick sleep assessment to uncover your unique needs. Receive tailored CBT programs and monitor your progress using state-of-the-art sleep tracking tools.',
      ),
      AuthView(),
    ],
  );
}
