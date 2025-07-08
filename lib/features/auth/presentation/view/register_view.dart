import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/auth/cubits/auth_cubit.dart';
import 'package:nap_nest/features/auth/data/service/auth_service.dart';
import 'package:nap_nest/features/auth/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
        create: (_) => AuthCubit(AuthService()),
          child: RegisterViewBody(),
          //
        ),
        //
      ),
    );
  }
}
