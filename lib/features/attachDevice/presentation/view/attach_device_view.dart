import 'package:flutter/material.dart';
import 'package:nap_nest/features/attachDevice/widgets/attach_device_view_body.dart';
import 'package:nap_nest/home_layout.dart';

class AttachDevice extends StatelessWidget {
  const AttachDevice({super.key});
  static const routeName = 'attachDevice';
  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      currentIndex: 2,
      screen: AttachDeviceViewBody(),
      //
    );
  }
}
