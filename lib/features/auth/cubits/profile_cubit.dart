import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/auth/cubits/profile_state.dart';
import 'package:nap_nest/features/auth/data/models/patient_profile_model.dart';
import 'package:nap_nest/features/auth/data/service/profile_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService _service;
  ProfileCubit(this._service) : super(ProfileInitial());

  UserProfileModel? _cachedProfile;

  UserProfileModel? get profile => _cachedProfile;

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await _service.getProfile();
      _cachedProfile = profile;
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError('Failed to load profile'));
    }
  }

  Future<void> updateProfile(UserProfileModel profile) async {
    emit(ProfileLoading());
    try {
      await _service.updateProfile(profile);
      await fetchProfile();
    } catch (e) {
      emit(ProfileError('Failed to update profile'));
    }
  }
}
