import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/attachDevice/widgets/custom_step.dart';
import 'package:nap_nest/features/attachDevice/widgets/connect_button.dart';

class AttachDeviceViewBody extends StatelessWidget {
  const AttachDeviceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final stepData = [
      {
        'title': 'Turn on the Device:',
        'description': 'Power on your device and ensure it\'s ready.',
      },
      {
        'title': 'Connect to the Device\'s Wi-Fi Network:',
        'description': 'Go to your Wi-Fi settings and join the network named MindArc.',
      },
      {
        'title': 'Open the connection Page:',
        'description':
            'Access the page linked in the button below. And enter your Wi-Fi Network Name (SSID) and Password.',
      },
      {
        'title': 'Save and Connect:',
        'description': 'Click Connect. Wait for the device to confirm a successful connection.',
      },
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How To Attach Your Device',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 9.h),
              Text(
                'Select your preferred relaxing soundtrack to listen to.',
                style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
              ),
              SizedBox(height: 40.h),
              Container(
                child: Expanded(
                  child: CustomSteps(
                    steps:
                        stepData
                            .map(
                              (data) => StepItem(
                                title: data['title'] ?? '',
                                description: data['description'] ?? '',
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
              const ConnectButton(),
        
              SizedBox(height: 68.h),
            ],
          ),
        ),
      ),
    );
  }
}
