import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghar_ka_khaana/screens/landing/landing.dart';
import 'package:ghar_ka_khaana/screens/login/email_login.dart';
import 'package:ghar_ka_khaana/screens/login/login_page.dart';
import 'package:ghar_ka_khaana/screens/home_screen.dart';
import 'package:ghar_ka_khaana/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(MyApp());
}

Future<void> initHive() {
  //Hive.registerAdapter<User>();
  //Hive.openBox('auth');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghar Ka Khaana',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: LandingPage(),
      routes: {
        AppRoutes.loginPage: (context) => LoginPage(),
        AppRoutes.homePage: (context) => HomeScreen(),
        AppRoutes.emailLoginPage: (context) => EmailLoginScreen(),
      },
    );
  }
}
