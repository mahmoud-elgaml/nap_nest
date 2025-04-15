import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class OtherRegister extends StatelessWidget {
  const OtherRegister({
    required this.onPressed,
    required this.image,
    super.key,
  });
  final VoidCallback onPressed;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: const Color(0xFFE2E4E8),
          radius: 30.0,
          child: SvgPicture.asset(
            fit: BoxFit.fill,
            image,
            width: 22.0,
            height: 22.0,
          ),
        ),
      ),
    );
  }
}
