import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_toast.dart';
import 'package:nap_nest/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:nap_nest/features/auth/presentation/widgets/reset_button.dart';

class SetNewPasswordViewBody extends StatefulWidget {
  const SetNewPasswordViewBody({super.key});
  static const routeName = 'setNewPasswordView';

  @override
  State<SetNewPasswordViewBody> createState() => _SetNewPasswordViewBodyState();
}

class _SetNewPasswordViewBodyState extends State<SetNewPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _passwordsMatch = false;
  bool isLoading = false;

  void _togglePasswordVisibility() => setState(() => _obscurePassword = !_obscurePassword);

  void _toggleConfirmPasswordVisibility() =>
      setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);

  void _checkPasswordMatch() {
    setState(() {
      _passwordsMatch =
          _passwordController.text.isNotEmpty &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  late String email;
  late String code;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    if (args != null && args['email'] != null && args['code'] != null) {
      email = args['email'];
      code = args['code'];
    } else {
      Navigator.pop(context);
      CustomToast.show(message: 'Missing data to reset password', isError: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordMatch);
    _confirmPasswordController.addListener(_checkPasswordMatch);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
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
                    Text('Login', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Set New Password',
                  style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Create a new password. Ensure it differs from previous ones for security.',
                  style: TextStyle(
                    color: AppColors.darkGreyTxtColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 64.h),
                CustomTextField(
                  controller: _passwordController,
                  label: 'New Password',
                  hint: 'Enter your password',
                  obscureText: _obscurePassword,
                  suffix: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: _obscurePassword ? Colors.grey : AppColors.primaryColor,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  validator:
                      (val) =>
                          val == null || val.isEmpty || val.length < 6
                              ? 'Password must be at least 6 characters'
                              : null,
                ),
                SizedBox(height: 20.h),
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
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                  validator:
                      (val) =>
                          val == null || val.isEmpty || val != _passwordController.text
                              ? 'Passwords do not match'
                              : null,
                ),
                SizedBox(height: 120.h),
                ResetButton(
                  buttonText: 'Update Password',
                  backgroundColor: AppColors.primaryColor,
                  opacity: _passwordsMatch ? 1.0 : 0.5,
                  onTap:
                      _passwordsMatch
                          ? () {
                            if (_formKey.currentState!.validate()) {
                            }
                          }
                          : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
