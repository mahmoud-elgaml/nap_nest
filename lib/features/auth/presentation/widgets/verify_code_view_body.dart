import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/success_message_view.dart';
import 'package:nap_nest/features/auth/presentation/widgets/set_new_password_body.dart';

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({super.key});

  @override
  State<VerifyCodeViewBody> createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(), //
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void onDigitEntered(int index, String value) {
    if (value.isNotEmpty && index < 4) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  bool get isCodeComplete => _controllers.every((controller) => controller.text.length == 1);

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
                Text('Login', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(height: 24.h),
            Text(
              'Check your email',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 380.w,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We sent a reset link to ',
                      style: TextStyle(
                        color: const Color(0xFF9EA8B9),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                        letterSpacing: -0.50.w,
                      ),
                    ),
                    TextSpan(
                      text: 'user email',
                      // text: 'Yomna24@gmail.com\n',
                      style: TextStyle(
                        color: AppColors.darkGreyTxtColor,
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'enter 5 digit code that mentioned in the email',
                      style: TextStyle(
                        color: const Color(0xFF9EA8B9),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                        letterSpacing: -0.50.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 148.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return SizedBox(
                  width: 50.w,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (value) => onDigitEntered(index, value),
                    cursorColor: AppColors.primaryColor,
                    scrollPhysics: BouncingScrollPhysics(),

                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      counterText: '',
                      focusColor: AppColors.primaryColor,

                      contentPadding: EdgeInsets.all(12.r),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Color(0xFF74B2E7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 148.h),
            Opacity(
              opacity: isCodeComplete ? 1.0 : 0.5,
              child: GestureDetector(
                onTap:
                    isCodeComplete
                        ? () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return SuccessMessage(
                                  message: 'Your password has been reset successfully!',
                                  title: 'Way To Go!',
                                  textButton: 'Set New Password',
                                  onPressed: () {
                                    Navigator.pushNamed(context, SetNewPasswordViewBody.routeName);
                                  },
                                );
                              },
                            ),
                          );
                        }
                        : () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
                  ),
                  child: Center(
                    child: Text(
                      'Verify Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFF9F9F9),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

