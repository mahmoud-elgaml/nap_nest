import 'package:nap_nest/features/auth/data/models/patient_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  final PatientModel user;
  AuthRegisterSuccess(this.user);
}

class AuthLoginSuccess extends AuthState {
  final String token;
  AuthLoginSuccess(this.token);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
