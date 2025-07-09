import 'package:flutter/material.dart';
import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/psqi_result_view_body.dart';

class PsqiResultView extends StatefulWidget {
  static const routeName = 'psqiResult';
  final Map<String, dynamic> result;

  const PsqiResultView({super.key, required this.result});

  @override
  State<PsqiResultView> createState() => _PsqiResultViewState();
}

class _PsqiResultViewState extends State<PsqiResultView> with SingleTickerProviderStateMixin {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CustomAppLoading()
        : AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: PsqiResultViewBody(result: widget.result),
        );
  }
}
