import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/features/attachDevice/widgets/connect_button.dart';

class AttachDeviceViewBody extends StatelessWidget {
  const AttachDeviceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            SizedBox(height: 8.h),
            Text(
              'Select your preferred relaxing soundtrack to listen  to.',
              style: TextStyle(fontSize: 16.sp, color: const Color(0xFF9EA8B9)),
            ),
            SizedBox(height: 24.h),
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
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5691E0),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              stepDescriptions[index],
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
           ConnectButton(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
