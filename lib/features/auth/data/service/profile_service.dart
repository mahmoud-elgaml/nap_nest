import 'package:dio/dio.dart';
import 'package:nap_nest/features/auth/data/models/patient_profile_model.dart';
import 'package:nap_nest/features/library/data/api/home_api.dart';

class ProfileService {
  final Dio _dio = HomeApiService.dio;

  Future<UserProfileModel> getProfile() async {
    final response = await _dio.get('profile');
    final userJson = response.data['user'];
    return UserProfileModel.fromJson(userJson);
  }

  Future<void> updateProfile(UserProfileModel profile) async {
    await _dio.put('profile/update', data: profile.toJson());
  }
}
