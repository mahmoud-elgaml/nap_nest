import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/auth/data/cubits/register_cubit.dart';
import 'package:nap_nest/features/auth/presentation/widgets/register_view_body.dart';
import 'package:nap_nest/services/api/api_service.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => RegisterCubit(ApiService()),
          child: RegisterViewBody(),
          //
        ),
        //
      ),
    );
  }
}
