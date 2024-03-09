import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodoro_app/pomodoro/bottomContainer.dart';

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
  late int totalSecond;
  int curRound = 0;
  int curGoal = 0;

  @override
  void initState() {
    sessions = widget.sessions;
    shortBreak = widget.shortBreak;
    longBreak = widget.longBreak;
    dailyGoal = widget.dailyGoal;
    sessionToLongBreak = widget.sessionToLongBreak;
    totalSecond = widget.sessions.toInt() * 60;
    super.initState();
  }

  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    print("sessions: $sessions");
    print("totalSecond: $totalSecond");
    if (totalSecond == 0) {
      setState(() {
        curRound = curRound + 1;
        isRunning = false;
        totalSecond = sessions.toInt() * 60;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSecond = totalSecond - 1;
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

  String format(int second) {
    var duration = Duration(seconds: second);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      format(totalSecond),
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svg/heartrate.svg",
                      width: 500,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).cardColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                )),
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
          BottomContainer(
            totalRound: dailyGoal.toInt(),
            totalGoal: sessionToLongBreak.toInt(),
            curRound: curRound,
            curGoal: curGoal,
          ),
        ],
      ),
    );
  }
}
