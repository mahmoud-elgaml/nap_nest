import 'package:flutter/material.dart';
import 'package:nap_nest/core/helper/on_generate_route.dart';
import 'package:nap_nest/features/splash/presentation/view/splash_view1.dart';

void main() {
  runApp(const NapNest());
}

class NapNest extends StatelessWidget {
  const NapNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView1.routeName,
    );
  }
}
