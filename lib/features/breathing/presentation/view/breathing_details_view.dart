import 'package:flutter/material.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_details_view_body.dart';
import 'package:nap_nest/home_layout.dart';

class BreathingDetailsView extends StatelessWidget {
  const BreathingDetailsView({super.key});
  static const routeName = 'breathingdetailsview';
  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      currentIndex: 4,
      screen: BreathingDetailsViewBody(),
      //
    );
  }
}
