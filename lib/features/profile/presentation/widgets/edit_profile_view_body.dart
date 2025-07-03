import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
  static const routeName = 'EditProfileScreen';
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController nameController = TextEditingController(text: 'Mohamed Ali');
  TextEditingController emailController = TextEditingController(text: 'Mohamedali@gmail.com');
  TextEditingController dobController = TextEditingController(text: '13/10/2001');

  String? gender = 'Male';

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2001, 10, 13),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dobController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: AppColors.containerColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),
      body: Padding(
        padding: const EdgeInsets.only(right:  20.0,left: 16,top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, size: 28.sp),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      //
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Edit Personal Information',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text('Name', style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.darkGreyTxtColor)),
              SizedBox(height: 8),
              TextField(controller: nameController, decoration: inputDecoration),
          
              SizedBox(height: 20),
              Text('Email', style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.darkGreyTxtColor)),
              SizedBox(height: 8),
              TextField(controller: emailController, decoration: inputDecoration),
          
              SizedBox(height: 20),
              Text('Date of Birth', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGreyTxtColor)),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: TextField(
                    controller: dobController,
                    decoration: inputDecoration.copyWith(suffixIcon: Icon(Icons.arrow_drop_down)),
                  ),
                ),
              ),
          
              SizedBox(height: 20),
              Text('Gender', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGreyTxtColor)),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GenderOption(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (val) => setState(() => gender = val),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GenderOption(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (val) => setState(() => gender = val),
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryColor),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text('Cancel', style: TextStyle(color: AppColors.primaryColor)),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String value;
  final String? groupValue;
  final void Function(String?) onChanged;

  const GenderOption({
    required this.value,
     required this.groupValue, required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: AppColors.primaryColor,
          ),
          Text(value),
        ],
      ),
    );
  }
}
