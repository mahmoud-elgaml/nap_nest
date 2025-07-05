import 'package:flutter/material.dart';
import 'package:nap_nest/features/myPlan/presentation/widgets/analyze_thoghts_view_body.dart';

class AnalyzeThoghtsView extends StatelessWidget {
  const AnalyzeThoghtsView({super.key});
  static const routeName = 'AnalyzeThouths';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AnalyzeThoghtsViewBody());
  }
}
