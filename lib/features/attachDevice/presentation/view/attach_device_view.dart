import 'package:flutter/material.dart';
import 'package:nap_nest/features/attachDevice/widgets/attach_device_view_body.dart';

class AttachDevice extends StatelessWidget {
  const AttachDevice({super.key});
  static const routeName = 'attachDevice';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: AttachDeviceViewBody(),
    //
    ),
    );
  }
}
