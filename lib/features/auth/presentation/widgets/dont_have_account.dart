import 'package:flutter/material.dart';
import 'package:nap_nest/features/auth/presentation/view/login_view.dart';
import 'package:nap_nest/features/auth/presentation/view/register_view.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    required this.text,
    required this.method,
    required this.isLogin,
    super.key,
  });
  final String text;
  final String method;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF414E61),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder:
                    (_) => isLogin ? const RegisterView() : const LoginView(),
              ),
            );
          },
          child: Text(
            method,
            style: TextStyle(
              color: const Color(0xFF74B2E7),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ), //       ),
          ),
        ),
      ],
    );
  }
}
