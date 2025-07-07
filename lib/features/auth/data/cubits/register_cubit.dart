import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/core/helpers/date_converter.dart';
import 'package:nap_nest/features/auth/data/models/patient_model.dart';
import 'package:nap_nest/services/api/api_service.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ApiService _apiService;

  RegisterCubit(this._apiService) : super(RegisterInitial());

  Future<void> registerUser({
  required String name,
  required String birthDate,
  required String gender,
  required String email,
  required String password,
  required String confirmPassword,
}) async {
  emit(RegisterLoading());

  try {
    final formattedDate = DateConverter.toApiFormat(birthDate);

    final user = await _apiService.register(
      name: name,
      birthDate: formattedDate,
      gender: gender,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (user != null) {
      emit(RegisterSuccess(user));
    } else {
      emit(RegisterFailure('Something went wrong!'));
    }

 } catch (e) {
      print('❌ Caught error in cubit: $e');
      emit(RegisterFailure(e.toString().replaceFirst('Exception: ', '')));
    }

}
}

