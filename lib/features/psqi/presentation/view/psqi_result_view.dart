import 'package:flutter/material.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/psqi_result_view_body.dart';

class PsqiResultView extends StatelessWidget {
  const PsqiResultView({super.key});
static const routeName = 'psqiResultView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PsqiResultViewBody(),
      ),
    );
  }
}