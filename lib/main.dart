import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/helpers/on_generate_route.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/auth/cubits/auth_cubit.dart';
import 'package:nap_nest/features/auth/data/service/auth_service.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/onboarding/presentation/views/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthCubit(AuthService()))],
      child: const NapNest(),
    ),
  );
}

class NapNest extends StatelessWidget {
  const NapNest({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isOnBoardingSeen = Prefs.getBool('isOnBoardingSeen');
    final bool isRegistered = Prefs.getBool('isRegistered');
    String initialRoute;
    if (!isOnBoardingSeen) {
      initialRoute = OnBoardingView.routeName;
    } else if (!isRegistered) {
      initialRoute = AuthView.routeName;
    } else {
      initialRoute = AuthView.routeName;
    }
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: ThemeData(
              fontFamily: 'Roboto',
              scaffoldBackgroundColor: Colors.white,
              splashColor: const Color.fromARGB(255, 164, 209, 248),
              splashFactory: InkRipple.splashFactory,
              primaryColor: AppColors.primaryColor,
              useMaterial3: true,
              brightness: Brightness.light,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.darkGreyTxtColor,
                selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
                unselectedIconTheme: IconThemeData(color: AppColors.darkGreyTxtColor),
                selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
                type: BottomNavigationBarType.shifting,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
                ),
              ),
            ),
            onGenerateRoute: onGenerateRoute,
            initialRoute: initialRoute,
          ),
    );
  }
}


/*
class AuthService {
  final Dio _dio = ApiService.dio;
  Future<PatientModel?> register({
    required String name,
    required String birthDate,
    required String gender,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post(
        'register',
        data: {
          'patient_name': name,
          'birth_date': birthDate,
          'gender': gender,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      print('📥 Status Code: ${response.statusCode}');
      print('📥 Response Data: ${response.data}');
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data['patient'] != null) {
        return PatientModel.fromJson(response.data['patient']);
      } else {
        throw Exception(response.data['message'] ?? 'Registration failed.');
      }
    } on DioException catch (e) {
      print('❌ DioException caught');
      print('👉 Type: ${e.type}');
      print('👉 Message: ${e.message}');
      print('👉 Response: ${e.response}');
      String errorMessage = 'Something wrong';

      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        if (data.containsKey('message')) {
          errorMessage = data['message'];
        } else if (data.containsKey('errors')) {
          final firstError = (data['errors'] as Map).values.first;
          if (firstError is List && firstError.isNotEmpty) {
            errorMessage = firstError[0];
          }
        }
      } else if (e.message != null) {
        errorMessage = e.message!;
      }
      throw Exception(errorMessage);
    }
  }

  /// ✅  يرجع التوكن
  Future<String> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('login', data: {'email': email, 'password': password});

      print('📥 Login Status: ${response.statusCode}');
      print('📥 Login Response: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['token'];
      } else {
        throw Exception(response.data['message'] ?? 'Login failed.');
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? e.message ?? 'Login failed. Please try again.';
      throw Exception(msg);
    }
  }

  /// ✅ ترجع كل البيانات { message, token }
  Future<Map<String, dynamic>> loginWithFullResponse({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('login', data: {'email': email, 'password': password});
      print('📥 Full Login Response: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data; // يحتوي على message + token
      } else {
        throw Exception(response.data['message'] ?? 'Login failed.');
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? e.message ?? 'Login error.';
      throw Exception(msg);
    }
  }

  Future<void> sendForgetPasswordEmail(String email) async {
    const String url =
        'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/password/forget';

    try {
      final response = await _dio.post(url, data: {'email': email});
      if (response.statusCode == 200 || response.statusCode == 201) {
        CustomToast.show(message: 'Email sent successfully. Check your inbox.', isError: false);
      } else {
        throw Exception('Unexpected error');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Something went wrong');
    }
  }

  Future<void> verifyOtpCode({required String email, required String code}) async {
    const String url =
        'https://test1-laravel-api-hraag6degva5f6cn.ukwest-01.azurewebsites.net/api/password/verify';
    try {
      final response = await _dio.post(url, data: {'email': email, 'otp_code': code});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.data['message'] ?? 'Invalid code');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Invalid code');
    }
  }

  Future<void> resetPassword({
    required BuildContext context,
    required String email,
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await _dio.post('password/reset', data: {'email': email});
      CustomToast.show(message: 'Email sent successfully. Check your inbox.', isError: false);

      CustomToast.show(message: 'Password updated successfully', isError: false);

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder:
              (_) => SuccessMessage(
                title: 'Way to go!',
                message: 'Your password has changed successfully!',
                textButton: 'Done',
                onPressed: () => Navigator.pushReplacementNamed(context, LoginView.routeName),
              ),
        ),
      );
    } on DioException catch (e) {
      CustomToast.show(
        message: e.response?.data['message'] ?? 'Something went wrong',
        isError: true,
      );
    }
  }
}

*/