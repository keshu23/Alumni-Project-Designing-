import 'package:alumni_project_designing/screens/Login/login_screen.dart';
import 'package:alumni_project_designing/screens/Register/signup_screen.dart';
import 'package:alumni_project_designing/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alumni App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
