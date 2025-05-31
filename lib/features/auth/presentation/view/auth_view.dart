import 'package:flutter/material.dart';
import 'package:nap_nest/features/auth/presentation/widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const routeName = 'authView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AuthViewBody()));
  }
}
