import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('images/animation_lo5upl4q.json'),
      nextScreen: LoginPage(),
      splashIconSize: 450,
      duration: 3000,
      animationDuration: Duration(seconds: 2),
      backgroundColor: Colors.black,
    );
  }
}

//Details(product: item(Path: 'Path', price: 2, name: 'name'), price: item(Path: "Path", price: 1, name: 'name'),),