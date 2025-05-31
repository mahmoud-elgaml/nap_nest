import 'package:flutter/material.dart';
import 'package:nap_nest/features/auth/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = 'forgetPassword';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ForgetPasswordViewBody());
  }
}
