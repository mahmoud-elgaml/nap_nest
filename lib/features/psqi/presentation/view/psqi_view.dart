import 'package:flutter/material.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/psqi_view_body.dart';

class PsqiView extends StatelessWidget {
  const PsqiView({super.key});
  static const routeName = 'psqiView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PsqiViewBody()));
  }
}
