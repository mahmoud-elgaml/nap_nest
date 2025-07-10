import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/helpers/on_generate_route.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/auth/cubits/auth_cubit.dart';
import 'package:nap_nest/features/auth/data/service/auth_service.dart';
import 'package:nap_nest/features/auth/presentation/view/auth_view.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';
import 'package:nap_nest/features/onboarding/presentation/views/on_boarding_view.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Prefs.init();
//   runApp(
//     MultiBlocProvider(
//       providers: [BlocProvider(create: (_) => AuthCubit(AuthService()))],
//       child: const NapNest(),
//     ),
//   );
// }

// class NapNest extends StatelessWidget {
//   const NapNest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bool isOnBoardingSeen = Prefs.getBool('isOnBoardingSeen');
//     final bool isRegistered = Prefs.getBool('isRegistered');

//     String initialRoute;
//     if (!isOnBoardingSeen) {
//       initialRoute = OnBoardingView.routeName;
//     } else if (!isRegistered) {
//       initialRoute = AuthView.routeName;
//     } else {
//       initialRoute = HomeView.routeName;
//     }

//     return ScreenUtilInit(
//       designSize: const Size(428, 926),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder:
//           (context, child) => MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               fontFamily: 'Roboto',
//               scaffoldBackgroundColor: Colors.white,
//               splashColor: const Color.fromARGB(255, 164, 209, 248),
//               splashFactory: InkRipple.splashFactory,
//               primaryColor: AppColors.primaryColor,
//               useMaterial3: true,
//               brightness: Brightness.light,
//               bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                 backgroundColor: Colors.white,
//                 selectedItemColor: AppColors.primaryColor,
//                 unselectedItemColor: AppColors.darkGreyTxtColor,
//                 selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
//                 unselectedIconTheme: IconThemeData(color: AppColors.darkGreyTxtColor),
//                 selectedLabelStyle: TextStyle(color: AppColors.primaryColor),
//                 type: BottomNavigationBarType.shifting,
//               ),
//               elevatedButtonTheme: ElevatedButtonThemeData(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primaryColor,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
//                 ),
//               ),
//             ),
//             onGenerateRoute: onGenerateRoute,
//             initialRoute: initialRoute,
//           ),
//     );
//   }
// }
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
      initialRoute = HomeView.routeName;
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
