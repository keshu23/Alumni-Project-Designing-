import 'package:alumni_project_designing/screens/Login/login_screen.dart';
import 'package:alumni_project_designing/screens/Register/signup_screen.dart';
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
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alumni Home"),
        backgroundColor: const Color(0xFF4A2E8A),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Welcome to Alumni App!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
