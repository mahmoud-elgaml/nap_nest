import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';
import 'package:nap_nest/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:nap_nest/features/auth/presentation/widgets/dont_have_account.dart';
import 'package:nap_nest/features/auth/presentation/widgets/other_register.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.37,
            padding: EdgeInsets.only(bottom: 30.h),
            child: Center(
              child: Image.asset(
                AppImages.imagesAppIcon,

                width: 134,
                height: 110,
              ),
            ),
          ),
          Expanded(
            child: Card(
              shadowColor: Colors.transparent,
              borderOnForeground: false,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(double.infinity),
                  topRight: Radius.circular(double.infinity),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.r),
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 32.h),

                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: _emailController,
                          label: 'Email',
                          hint: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) return 'Enter your email';
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(val)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          obscureText: _obscurePassword,
                          suffix: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                          ),
                          validator:
                              (val) =>
                                  val!.length < 6
                                      ? 'Minimum 6 characters'
                                      : null,
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Text(
                              'Forget your password?',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(
                          text: 'Login',
                          color: AppColors.primaryColor,
                          width: double.infinity,
                          onPressed: () {},
                        ),
                        SizedBox(height: 24.h),
                        const Text('Or'),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OtherRegister(
                              image: AppImages.imagesIconsGoogle,
                              onPressed: () {},
                            ),
                            OtherRegister(
                              image: AppImages.imagesIconsFacebook,
                              onPressed: () {},
                            ),
                            OtherRegister(
                              image: AppImages.imagesIconsApple,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        HaveAccount(
                          isLogin: true,
                          text: "Don't have an account?",
                          method: 'Sign Up',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
