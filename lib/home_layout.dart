import 'package:flutter/material.dart';
import 'package:nap_nest/core/constants/custom_bottom_navbar.dart';
import 'package:nap_nest/features/home/presentation/widgets/home_view_body.dart';
import 'package:nap_nest/features/myPlan/presentation/views/my_plan_view.dart';
import 'package:nap_nest/features/nestTime/presentation/views/nest_time_view.dart';
import 'package:nap_nest/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:nap_nest/statistics/presentation/views/statistics_view.dart';

class HomeLayout extends StatefulWidget {
  final Widget? screen;
  final int currentIndex;

  const HomeLayout({
    Key? key,
    this.screen,
    this.currentIndex = 0,
    //
  }) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeLayout> with TickerProviderStateMixin {
  late int selectedIndex;

  final List<Widget> pages = [
    const HomeViewBody(),
    const NestTimeView(),
    const MyPlanView(),
    const StatisticsView(),
    const ProfileViewBody(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          widget.screen ??
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder:
                (child, animation) => FadeTransition(opacity: animation, child: child),
            child: IndexedStack(
              key: ValueKey<int>(selectedIndex),
              index: selectedIndex,
              children: pages,
            ),
          ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}