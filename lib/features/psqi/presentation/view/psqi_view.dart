import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/psqi/cubit/psqi_cubit.dart';
import 'package:nap_nest/features/psqi/data/api/psqi_service.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/psqi_view_body.dart';
class PsqiView extends StatelessWidget {
  const PsqiView({super.key});

  static const routeName = '/psqiView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => PsqiCubit((PsqiService())),     
             child: PsqiViewBody(),
        //
        ),
      ),
    );
  }
}
