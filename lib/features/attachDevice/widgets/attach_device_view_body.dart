import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/attachDevice/widgets/connect_button.dart';

class AttachDeviceViewBody extends StatelessWidget {
  const AttachDeviceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111111),
              ),
            ),
            SizedBox(height: 9.h),
            Text(
              'Select your preferred relaxing soundtrack to listen  to.',
              style: TextStyle(fontSize: 16.sp, color: Color(0xff9FA9BA)),
            ),
            SizedBox(height: 60.h),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_, __) => SizedBox(height: 30.h),
                itemBuilder: (context, index) {
                  final stepTitles = [
                    'Turn on the Device:',
                    'Connect to the Device’s Wi-Fi Network:',
                    'Open the connection Page:',
                    'Save and Connect:',
                  ];
                  final stepDescriptions = [
                    'Power on your device and ensure it’s ready.',
                    'Go to your Wi-Fi settings and join the network named MindArc.',
                    'Access the page linked in the button below, And enter your Wi-Fi Network Name (SSID) and Password.',
                    'Click Connect. Wait for the device to confirm a successful connection.',
                  ];

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 14.r,
                            backgroundColor: const Color(0xff5691E0),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (index != 3)
                            Container(width: 2.w, height: 60.h, color: const Color(0xff5691E0)),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stepTitles[index],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              stepDescriptions[index],
                              style: TextStyle(fontSize: 16.sp, color: AppColors.darkGreyTxtColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ConnectButton(),
            SizedBox(height: 68.h),
          ],
        ),
      ),
    );
  }
}
