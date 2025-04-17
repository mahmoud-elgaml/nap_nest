import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:nap_nest/features/auth/presentation/widgets/reset_button.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController _emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
    final email = _emailController.text;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    setState(() {
      isEmailValid = emailRegex.hasMatch(email);
    });
  }

  void resetPassword() {
    print('Resetting password for: ${_emailController.text}');
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 74.h),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, size: 28.sp),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 28.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Please enter your email to reset the password',
                style: TextStyle(
                  color: const Color(0xFF9EA8B9),
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 132.h),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val == null || val.isEmpty) return 'Enter your email';
                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!emailRegex.hasMatch(val)) return 'Enter a valid email';
                return null;
              },
            ),
            SizedBox(height: 200.h),
            ResetButton(
              buttonText: 'Reset Password',
              backgroundColor: const Color(0xFF74B2E7),
              opacity: isEmailValid ? 1.0 : 0.5,
              onTap: isEmailValid ? resetPassword : () {},
            ),
          ],
        ),
      ),
    );
  }
}
