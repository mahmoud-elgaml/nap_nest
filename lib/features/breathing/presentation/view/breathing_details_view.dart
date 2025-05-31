import 'package:flutter/material.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_details_view_body.dart';
import 'package:nap_nest/home_layout.dart';

class BreathingDetailsView extends StatelessWidget {
  const BreathingDetailsView({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
  });

  static const routeName = 'breathingdetailsview';

  final String title;
  final String description;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      currentIndex: 4,
      screen: BreathingDetailsViewBody(title: title, description: description, duration: duration),
    );
  }
}
