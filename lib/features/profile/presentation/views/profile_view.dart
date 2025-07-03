import 'package:flutter/material.dart';
import 'package:nap_nest/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
       body: ProfileViewBody(),
       //
       );
  }
}
