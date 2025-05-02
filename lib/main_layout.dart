import 'package:flutter/material.dart';
import 'package:nap_nest/core/constants/custom_bottom_navbar.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/home/presentation/widgets/home_view_body.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_view.dart';
import 'package:nap_nest/features/soundtrack/presentation/view/sound_track_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeLayout> {
  int _selectedIndex = 2;
  late final PageController _pageController;

  final List<Widget> _pages = [
    const Placeholder(), // الصفحة الرئيسية
    const SoundTrackView(), // صفحة الموسيقى
    const HomeViewBody(), //  (صفحة الاساسية)
    const PsqiView(), // صفحة الإحصائيات
    const AuthView(), // صفحة الحساب الشخصي
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
