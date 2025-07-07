import 'package:flutter/material.dart';
import 'package:nap_nest/features/myPlan/presentation/widgets/my_plan_view_body.dart';

class MyPlanView extends StatelessWidget {
  const MyPlanView({super.key});
  static const routeName = 'myPlan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color(0xFFF8F8F8),
      body: MyPlanViewBody(),
    );
  }
}