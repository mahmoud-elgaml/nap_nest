import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/core/helpers/date_converter.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/features/auth/cubits/auth_states.dart';
import 'package:nap_nest/features/auth/data/service/auth_service.dart';
class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> registerUser({
    required String name,
    required String birthDate,
    required String gender,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    try {
      final formattedDate = DateConverter.toApiFormat(birthDate);
      final patient = await _authService.register(
        name: name,
        birthDate: formattedDate,
        gender: gender,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      if (patient != null) {
        await Prefs.setInt('patient_id', patient.patientId);
        await Prefs.setBool('isRegistered', true);
        emit(AuthRegisterSuccess(patient));
      } else {
        emit(AuthFailure('Registration failed.'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  Future<void> loginUser({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final token = await _authService.login(email: email, password: password);
      await Prefs.setString('token', token);
      await Prefs.setBool('isRegistered', true);
      emit(AuthLoginSuccess(token));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
