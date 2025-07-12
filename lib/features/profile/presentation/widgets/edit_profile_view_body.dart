import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/custom_toast.dart';
import 'package:nap_nest/features/auth/data/models/patient_profile_model.dart';
import 'package:nap_nest/features/auth/data/service/profile_service.dart';

class EditProfileView extends StatefulWidget {
  static const routeName = 'EditProfileScreen';
  final UserProfileModel user;

  const EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  String? gender;

Future<void> _selectDate() async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (pickedDate != null) {
    setState(() {
      dobController.text =
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
    });
  }
}

  @override
  void initState() {
    super.initState();
    final user = widget.user;
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    dobController = TextEditingController(text: user.birthDate);
    gender = user.gender;
  }

  @override
  Widget build(BuildContext context) {

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: AppColors.containerColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 16, top: 60),
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
                  Text('Profile', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Edit Personal Information',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGreyTxtColor),
              ),
              SizedBox(height: 8),
              TextField(controller: nameController, decoration: inputDecoration),
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGreyTxtColor),
              ),
              SizedBox(height: 8),
              TextField(controller: emailController, decoration: inputDecoration),
              SizedBox(height: 20),
              Text(
                'Date of Birth',
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGreyTxtColor),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: TextField(
                    controller: dobController,
                    decoration: inputDecoration.copyWith(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkGreyTxtColor),
              ),
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
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryColor),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text('Cancel', style: TextStyle(color: AppColors.primaryColor)),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final updatedUser = UserProfileModel(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          birthDate: dobController.text.trim(),
                          gender: gender ?? '',
                        );
                        try {
                          await ProfileService().updateProfile(updatedUser);
                          CustomToast.show(message: '✅ Profile updated', isError: false);
                          Navigator.pop(context);
                        } catch (_) {
                          CustomToast.show(message: '❌ Update failed', isError: true);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Save', style: TextStyle(color: Colors.white)),
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
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
