import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Onboarding()));
    });
  }

  // _navigateToHome() async {
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const Onboarding()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/clock.png"),
            Text(
              "POMO",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
