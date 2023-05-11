import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentication/pages/signin_page/signin_screen.dart';
import 'package:flutter_application_1/src/features/authentication/pages/signup_page/signup_screen.dart';
import 'package:flutter_application_1/src/features/core/pages/chat_screen/chat_screen.dart';
import 'package:flutter_application_1/src/features/core/pages/dashboard_page/home_page.dart';
import 'package:flutter_application_1/src/features/core/pages/profile/profile_page.dart';
import 'package:flutter_application_1/src/features/core/pages/update_profile/updat_profile_page.dart';
import 'package:flutter_application_1/src/utils/shared_service.dart';
import 'package:flutter_application_1/src/utils/themes/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Widget _defoultHome = const SigninPage();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedService.isLoggedIn();
  if (result) {
    _defoultHome = const HomePage();
  }
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
      title: 'Blood Donation',
      initialRoute: '/',
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder>{
        '/': (context) => _defoultHome,
        '/home': (context) => const HomePage(),
        '/registore': (context) => const SignUpPage(),
        '/login': (context) => const SigninPage(),
        '/profile': (context) => const ProfilePage(),
        '/profile-update': (context) => const UpdateProfilePage(),
        '/message': (context) => const ChatScreen(),
      },
    );
  }
}
