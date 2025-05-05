import 'package:flutter/material.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_view_body.dart';
import 'package:nap_nest/home_layout.dart';

class BreathingView extends StatelessWidget {
  const BreathingView({super.key});
static const  routeName = 'breathingview';
  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      currentIndex: 4,
      screen: BreathingViewBody(),
      //
    );
  }
}
