import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
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
            color: AppColors.darkGreyTxtColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute<void>(
                builder:
                    (_) => isLogin ? const RegisterView() : const LoginView(),
              ),
            );
          },
          child: Text(
            method,
            style: TextStyle(
              color:  AppColors.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ), //       ),
          ),
        ),
      ],
    );
  }
}
