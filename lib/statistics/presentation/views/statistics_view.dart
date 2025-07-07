import 'package:flutter/material.dart';
import 'package:nap_nest/statistics/presentation/widgets/statistics_view_body.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});
static const routeName = 'statistics';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StatisticsViewBody());
  }
}