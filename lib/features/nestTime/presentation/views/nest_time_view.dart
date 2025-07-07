import 'package:flutter/material.dart';
import 'package:nap_nest/features/nestTime/presentation/widgets/nest_time_view_body.dart';

class NestTimeView extends StatelessWidget {
  const NestTimeView({super.key});
static const routeName = 'nestTime';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestTimeViewBody(),
    );
  }
}