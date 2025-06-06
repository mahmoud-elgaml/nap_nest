import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/helper/on_generate_route.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/features/home/presentation/view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    ScreenUtilInit(
      designSize: Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => NapNest(),
    ),
  );
}

class NapNest extends StatelessWidget {
  const NapNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
        fontFamily: 'Roboto',
        splashColor: Color.fromARGB(255, 164, 209, 248),
        splashFactory: InkRipple.splashFactory,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primaryColor,
        useMaterial3: true, 
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}



