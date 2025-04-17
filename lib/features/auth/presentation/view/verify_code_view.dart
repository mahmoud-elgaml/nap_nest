import 'package:flutter/material.dart';
import 'package:nap_nest/features/auth/presentation/widgets/verify_code_view_body.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});
  static const routeName = 'verifyCode';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: VerifyCodeViewBody());
  }
}
