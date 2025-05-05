import 'package:flutter/material.dart';
import 'package:nap_nest/core/constants/custom_bottom_navbar.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/home/presentation/widgets/home_view_body.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_view.dart';
import 'package:nap_nest/features/soundtrack/presentation/view/sound_track_view.dart';

class HomeLayout extends StatefulWidget {
  final Widget? screen;
  final int currentIndex;

  const HomeLayout({Key? key, this.screen, this.currentIndex = 2}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeLayout> {
  late int selectedIndex;

  final List<Widget> pages = [
    const Placeholder(), // Home page
    const SoundTrackView(), // Music page
    const HomeViewBody(), // Main page (center)
    const PsqiView(), // Statistics page
    const AuthView(), // Profile page
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
  }

  void onBottomNavPressed(int index) {
    if (widget.screen != null && selectedIndex == index) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      return;
    }

    setState(() {
      selectedIndex = index;
    });

    if (widget.screen != null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.screen ?? pages[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onBottomNavPressed,
      ),
    );
  }
}
