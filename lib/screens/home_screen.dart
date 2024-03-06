import 'package:flutter/material.dart';
import 'package:pomodoro_app/pomodoro/timerContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sessions = 25.0;
  double shortBreak = 5.0;
  double longBreak = 15.0;
  double dailyGoal = 0.0;
  double sessionToLongBreak = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/timer.png"),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimerContainer(
                    content: "SESSIONS",
                    value: sessions,
                    division: 12,
                  ),
                  TimerContainer(
                    content: "SHORT BREAKS",
                    value: shortBreak,
                    division: 10,
                    max: 10,
                  ),
                  TimerContainer(
                    content: "LONG BREAKS",
                    value: longBreak,
                    division: 6,
                    max: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimerContainer(
                    content: "DAILY GOAL",
                    value: dailyGoal,
                    isBig: true,
                    division: 60,
                  ),
                  TimerContainer(
                    content: "SESSIONS TO LONG BREAK",
                    value: sessionToLongBreak,
                    isBig: true,
                    division: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
