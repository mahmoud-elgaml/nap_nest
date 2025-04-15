import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/helper/on_generate_route.dart';
import 'package:nap_nest/features/auth/presentation/view/register_view.dart';

void main() {
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
    initialRoute: RegisterView.routeName,
  );
}
