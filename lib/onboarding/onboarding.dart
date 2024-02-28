import 'package:flutter/material.dart';
import 'package:pomodoro_app/onboarding/step1.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int onboardingStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20.0),
        child: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Theme.of(context).cardColor,
            title: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(10, 20),
              ),
              onPressed: () {
                print("SKIP button");
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).textTheme.displayLarge!.color,
                ),
              ),
            )),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Step1(
        onboardingStep: onboardingStep,
      ),
    );
  }
}
