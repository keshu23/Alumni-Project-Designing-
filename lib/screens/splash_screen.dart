import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  // Constants for better maintainability
  static const Duration _splashDuration = Duration(seconds: 3);
  static const String _loginRoute = '/login';

  // Colors matching login/signup screen
  static const Color _primaryColor =
      Color(0xFF4F46E5); // From your button & icon
  static const Color _backgroundColor = Color(0xFFF9FAFB); // Light background
  static const Color _white = Colors.white;
  static const Color _white70 = Colors.white70;
  static const Color _white60 = Colors.white60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(_splashDuration, () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, _loginRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogoContainer(),
              const SizedBox(height: 24),
              _buildAppTitle(),
              const SizedBox(height: 80),
              _buildProgressIndicator(),
              const SizedBox(height: 20),
              _buildLoadingText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoContainer() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 60,
          width: 60,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.school,
              size: 60,
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppTitle() {
    return const Text(
      "Welcome",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return const SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
        strokeWidth: 3,
      ),
    );
  }

  Widget _buildLoadingText() {
    return const Text(
      "Loading...",
      style: TextStyle(
        fontSize: 16,
        color: Colors.black45,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
