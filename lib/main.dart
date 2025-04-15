import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/helper/on_generate_route.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view1.dart';

void main() async {
  await SharedPreferencesSingleton.init();
  runApp(
    ScreenUtilInit(
      designSize: Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const NapNest(),
    ),
  );
}

class NapNest extends StatelessWidget {
  const NapNest({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Roboto'),
    onGenerateRoute: onGenerateRoute,
    initialRoute: SplashView1.routeName,
  );
}
