import 'package:flutter/material.dart';
import 'package:nap_nest/home_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return const HomeLayout();
  }
}
