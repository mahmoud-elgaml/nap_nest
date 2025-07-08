import 'package:flutter/material.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/psqi_result_view_body.dart';

class PsqiResultView extends StatelessWidget {
  static const String routeName = 'psqiResult';

  final Map<String, dynamic> result;

  const PsqiResultView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return PsqiResultViewBody(result: result);
  }
}

