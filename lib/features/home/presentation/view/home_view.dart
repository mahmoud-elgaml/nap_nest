import 'package:flutter/material.dart';
import 'package:nap_nest/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: HomeViewBody()),
    
    );
  }
}
