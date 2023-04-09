import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/home_page.dart';
import 'package:flutter_application_1/src/features/core/pages/splash_page/splash_screen.dart';
import 'package:flutter_application_1/src/utils/themes/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CAppTheme.ligthTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
