import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/utils/app_images.dart';
import 'package:nap_nest/core/widgets/custom_button.dart';
import 'package:nap_nest/core/widgets/custom_circular_indicator.dart';
import 'package:nap_nest/core/widgets/custom_toast.dart';
import 'package:nap_nest/features/auth/cubits/auth_cubit.dart';
import 'package:nap_nest/features/auth/cubits/auth_states.dart';
import 'package:nap_nest/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:nap_nest/features/auth/presentation/widgets/date_ofbirth_field.dart';
import 'package:nap_nest/features/auth/presentation/widgets/dont_have_account.dart';
import 'package:nap_nest/features/auth/presentation/widgets/gender_selection.dart';
import 'package:nap_nest/features/auth/presentation/widgets/other_register.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_view.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});
  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String _selectedGender = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print('📍 State changed: $state');

        if (state is AuthRegisterSuccess) {
          CustomToast.show(message: 'Welcome ${state.user.patientName}', isError: false);

          Navigator.pushNamed(context, PsqiView.routeName);
        } else if (state is AuthFailure) {
          CustomToast.show(message: state.error, isError: true);
        }
      },
      //  return BlocListener<AuthCubit, AuthState>(
      //   listener: (context, state) {
      //     if (state is AuthRegisterSuccess) {
      //       CustomToast.show(message: 'Welcome ${state.user.patientName}', isError: false);
      //       Navigator.pushNamed(context, PsqiView.routeName);
      //     } else if (state is AuthFailure) {
      //       CustomToast.show(message: state.error, isError: true);
      //     }
      //   },
      child: Column(
        children: [
          Container(
            height: 127.h,
            margin: EdgeInsets.only(top: 32.h),
            child: Center(child: Image.asset(Assets.imagesAppIcon, width: 74.w, height: 64.h)),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(999.r),
                  topRight: Radius.circular(999.r),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBFB),
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
                        // Full Name
                        CustomTextField(
                          controller: _nameController,
                          label: 'Full Name',
                          hint: 'Enter your name',
                          validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                        ),
                        SizedBox(height: 16.h),
                        // Date of Birth
                        DateOfBirthField(controller: _dobController),
                        SizedBox(height: 16.h),
                        GenderSelectionField(
                          selectedGender: _selectedGender,
                          onGenderSelected: (gender) {
                            setState(() => _selectedGender = gender);
                          },
                        ),
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
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: _obscurePassword ? Colors.grey : AppColors.primaryColor,
                            ),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                          validator: (val) => val!.length < 6 ? 'Minimum 6 characters' : null,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          hint: 'Re-enter your password',
                          obscureText: _obscureConfirmPassword,
                          suffix: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                              color: _obscureConfirmPassword ? Colors.grey : AppColors.primaryColor,
                            ),
                            onPressed:
                                () => setState(
                                  () => _obscureConfirmPassword = !_obscureConfirmPassword,
                                ),
                          ),
                          validator:
                              (val) =>
                                  val != _passwordController.text ? "Passwords don't match" : null,
                        ),
                        SizedBox(height: 24.h),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return CustomCircularIndicator();
                            }
                            return CustomButton(
                              text: 'Sign Up',
                              color: AppColors.primaryColor,
                              width: double.infinity,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_selectedGender.isEmpty || _dobController.text.isEmpty) {
                                    CustomToast.show(
                                      message: 'Please complete all fields',
                                      isError: true,
                                    );
                                    return;
                                  }
                                  context.read<AuthCubit>().registerUser(
                                    name: _nameController.text.trim(),
                                    birthDate: _dobController.text.trim(),
                                    gender: _selectedGender,
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                    confirmPassword: _confirmPasswordController.text,
                                  );
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 12.h),
                        const Text('Or'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OtherRegister(image: Assets.imagesGoogle, onPressed: () {}),
                            OtherRegister(image: Assets.imagesFacebook, onPressed: () {}),
                            OtherRegister(image: Assets.imagesApple, onPressed: () {}),
                          ],
                        ),
                        const HaveAccount(
                          isLogin: false,
                          text: 'Already have an account?',
                          method: 'Login',
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
