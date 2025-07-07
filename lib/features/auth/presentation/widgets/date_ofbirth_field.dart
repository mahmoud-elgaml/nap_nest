import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class DateOfBirthField extends StatefulWidget {
  final TextEditingController controller;

  const DateOfBirthField({super.key, required this.controller});

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2001, 10, 13),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Birthdate',
            style: TextStyle(
              color: AppColors.darkGreyTxtColor,
              fontSize: 16.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: _selectDate,
            child: AbsorbPointer(
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: ShapeDecoration(
                  color: AppColors.containerColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: widget.controller,
                        style:  TextStyle(
                          color: const Color(0xFF9EA8B9),

                          fontSize: 16.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'DD/MM/YYYY',
                        ),
                      ),
                    ),
                    const Icon(Icons.date_range_outlined, color: const Color(0xFF9EA8B9)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
