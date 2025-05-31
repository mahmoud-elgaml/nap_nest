import 'package:flutter/material.dart';
import 'package:nap_nest/core/constants/custom_bottom_navbar.dart';
import 'package:nap_nest/features/attachDevice/widgets/attach_device_view_body.dart';
import 'package:nap_nest/features/breathing/presentation/widgets/breathing_view_body.dart';
import 'package:nap_nest/features/home/presentation/widgets/home_view_body.dart';
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
  late PageController _pageController;

  final List<Widget> pages = [
    const AttachDeviceViewBody(), // Home page
    const SoundTrackView(), // Bed
    const HomeViewBody(), // Main
    const Placeholder(), // Stats
    const BreathingViewBody(), // Profile
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
    _pageController = PageController(initialPage: selectedIndex,);
  }

  void onBottomNavPressed(int index) {
    _pageController.animateToPage(index, 
    duration: const Duration(milliseconds: 300), 
    curve: Curves.easeInOutQuint,
    
    );
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          widget.screen ??
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => selectedIndex = index);
            },
            children: pages,
            physics: const BouncingScrollPhysics(),
          ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onBottomNavPressed,
      ),
    );
  }
}
