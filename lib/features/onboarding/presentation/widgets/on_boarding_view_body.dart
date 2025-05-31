import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/constants.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/onboarding/presentation/on_boarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(child: OnboardingPageView(pageController: pageController)),
      Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Visibility(
          visible: currentPage < 2,
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              size: Size(6.w, 6.h),
              spacing: EdgeInsets.symmetric(horizontal: 2.w),
              activeSize: Size(6.w, 6.h),
              activeColor: const Color(0xff111111),
              color: Colors.grey,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Visibility(
          visible: currentPage < 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: CustomButton(
              text: 'Next',
              onPressed: () {
                Prefs.setBool(kIsOnBoardingSeen, true);
                if (currentPage == 2) {
                  Navigator.pushReplacementNamed(context, AuthView.routeName);
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    ],
  );
}
