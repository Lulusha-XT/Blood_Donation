import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentication/pages/splash_screen/splash_screen.dart';
import 'package:flutter_application_1/src/utils/themes/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
