import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/auth/data/cubits/auth_cubit.dart';
import 'package:nap_nest/features/auth/data/service/auth_api.dart';
import 'package:nap_nest/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocProvider(
        create: (_) => AuthCubit(AuthApi()),
        child: LoginViewBody(),
        //
      ),
    ),
  );
}
