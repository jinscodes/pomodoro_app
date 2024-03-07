import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  final double sessions;
  final double shortBreak;
  final double longBreak;
  final double dailyGoal;
  final double sessionToLongBreak;

  const PomodoroScreen(
      {super.key,
      required this.sessions,
      required this.shortBreak,
      required this.longBreak,
      required this.dailyGoal,
      required this.sessionToLongBreak});

  @override
  State<PomodoroScreen> createState() => _PomodoroState();
}

class _PomodoroState extends State<PomodoroScreen> {
  late double sessions;
  late double shortBreak;
  late double longBreak;
  late double dailyGoal;
  late double sessionToLongBreak;

  @override
  void initState() {
    sessions = widget.sessions;
    shortBreak = widget.shortBreak;
    longBreak = widget.longBreak;
    dailyGoal = widget.dailyGoal;
    sessionToLongBreak = widget.sessionToLongBreak;
    super.initState();
  }

  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (sessions == 0) {
      setState(() {
        dailyGoal = dailyGoal + 1;
        isRunning = false;
        sessions = sessions; // reset
      });
      timer.cancel();
    } else {
      setState(() {
        sessions = sessions - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int minutes) {
    var duration = Duration(minutes: minutes);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    print("1: $sessions");
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(sessions.toInt()),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "${dailyGoal.toInt()}",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
