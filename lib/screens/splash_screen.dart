import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
        animationDuration: const Duration(milliseconds: 2000),
        splash: 'assets/images/splashLogo.jpeg',
        duration: 2000,
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
