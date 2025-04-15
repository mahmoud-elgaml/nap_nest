// import 'package:flutter/material.dart';
// import 'package:nap_nest/core/utils/app_colors.dart';

// class InputField extends StatelessWidget {
//   const InputField({
//     required this.title,
//     required this.hintText,
//     super.key,
//     this.suffixIcon,
//     this.keyboardType,
//   });
//   final String title;
//   final String hintText;
//   final Widget? suffixIcon;
//   final TextInputType? keyboardType;
//   @override
//   Widget build(BuildContext context) => Form(
//     child: Column(
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         TextFormField(
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(
//               vertical: 19.0,
//               horizontal: 20.0,
//             ),
//             filled: true,
//             fillColor: const Color(0xFFE2E4EB),
//             hintText: hintText,
//             suffixIcon: suffixIcon,
//             hintStyle: const TextStyle(
//               fontSize: 16.0,
//               color: AppColors.darkGreyTxtColor,
//             ),
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF414E61),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF9EA8B9),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: const Color(0xFFE2E4E8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
