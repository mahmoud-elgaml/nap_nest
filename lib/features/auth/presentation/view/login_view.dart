import 'package:flutter/material.dart';
import 'package:nap_nest/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: LoginViewBody()));
}
