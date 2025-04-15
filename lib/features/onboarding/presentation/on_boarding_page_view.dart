import 'package:flutter/material.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/onboarding/presentation/views/widgets/page_view_item.dart.dart';

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

// linter:
//   rules:
//     # Disabling any rule by default
//     avoid_print: false
//     curly_braces_in_flow_control_structures: true
//     prefer_single_quotes: true

// # Analyzer options
// analyzer:
//   exclude:
//     - '**/*.g.dart'
//     - '**/*.freezed.dart'
//     - '**/*.gr.dart'
//   errors:
//     # Treating warnings as errors (optional)
//     missing_return: warning
//     unused_element: error

// # Deprecated rules you want to disable
// deprecated_member_use: false

// # Enable Flutter specific linting rules
// flutter:
//   rules:
//     prefer_const_constructors: true
//     prefer_final_fields: true
//     avoid_renaming_method_parameters: true
//     use_key_in_widget_constructors: true
