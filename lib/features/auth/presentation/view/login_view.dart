import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/auth/data/cubits/auth_cubit.dart';
import 'package:nap_nest/features/auth/presentation/widgets/login_view_body.dart';
import 'package:nap_nest/services/api/api_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocProvider(create: (_) => AuthCubit(AuthService()),
       child: LoginViewBody(),
       //
       ),
    ),
  );
}
