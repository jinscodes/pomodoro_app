import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/button.dart';
import 'package:pomodoro_app/pomodoro/timerContainer.dart';
import 'package:pomodoro_app/screens/pomodoro_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // double sessions = 25.0;
  double sessions = 1.0;
  double shortBreak = 5.0;
  double longBreak = 15.0;
  double dailyGoal = 4.0;
  double sessionToLongBreak = 1.0;

  void updateSessions(double newValue) {
    setState(() {
      sessions = newValue;
    });
  }

  void updateShortBreak(double newValue) {
    setState(() {
      shortBreak = newValue;
    });
  }

  void updateLongBreak(double newValue) {
    setState(() {
      longBreak = newValue;
    });
  }

  void updateDailyGoal(double newValue) {
    setState(() {
      dailyGoal = newValue;
    });
  }

  void updateSessionToLongBreak(double newValue) {
    setState(() {
      sessionToLongBreak = newValue;
    });
  }

  void toPomodoroScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PomodoroScreen(
                  sessions: sessions,
                  shortBreak: shortBreak,
                  longBreak: longBreak,
                  dailyGoal: dailyGoal,
                  sessionToLongBreak: sessionToLongBreak,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 5,
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
                        Expanded(
                          child: TimerContainer(
                            content: "SESSIONS",
                            value: sessions,
                            updateSetting: updateSessions,
                            division: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TimerContainer(
                            content: "SHORT BREAKS",
                            value: shortBreak,
                            updateSetting: updateShortBreak,
                            division: 10,
                            max: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TimerContainer(
                            content: "LONG BREAKS",
                            value: longBreak,
                            updateSetting: updateLongBreak,
                            division: 6,
                            max: 30,
                          ),
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
                        Expanded(
                          child: TimerContainer(
                            content: "DAILY GOAL",
                            value: dailyGoal,
                            updateSetting: updateDailyGoal,
                            isBig: true,
                            division: 10,
                            max: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TimerContainer(
                            content: "SESSIONS TO LONG BREAK",
                            value: sessionToLongBreak,
                            updateSetting: updateSessionToLongBreak,
                            isBig: true,
                            division: 10,
                            max: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Button(
                  handleClick: () {
                    toPomodoroScreen();
                  },
                  content: "START"),
            ),
          ],
        ),
      ),
    );
  }
}
