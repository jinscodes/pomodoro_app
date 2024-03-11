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
  late int shortBreak;
  late int longBreak;
  late double dailyGoal;
  late double sessionToLongBreak;
  late int totalSecond;
  int curRound = 0;
  int curGoal = 0;
  String step = "sessions";
  Timer? _blink;
  bool _show = true;

  @override
  void initState() {
    sessions = widget.sessions;
    shortBreak = widget.shortBreak.toInt() * 60;
    longBreak = widget.longBreak.toInt() * 60;
    dailyGoal = widget.dailyGoal;
    sessionToLongBreak = widget.sessionToLongBreak;
    totalSecond = widget.sessions.toInt() * 60;
    super.initState();
  }

  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSecond == 0) {
      if (curRound + 1 == sessionToLongBreak) {
        setState(() {
          curRound = 0;
          curGoal = curGoal + 1;
          step = "break";
        });
      } else {
        setState(() {
          curRound = curRound + 1;
          step == "break";
        });
      }
      setState(() {
        isRunning = false;
        totalSecond = sessions.toInt() * 60;
      });
      timer.cancel();
      _blink?.cancel();
    } else {
      setState(() {
        // totalSecond = totalSecond - 1;
        totalSecond = totalSecond - 10;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    blinkSvg();
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    _blink?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int second) {
    var duration = Duration(seconds: second);
    return duration.toString().split(".").first.substring(2, 7);
  }

  void blinkSvg() {
    _blink = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() => _show = !_show);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: step == "sessions"
          ? Theme.of(context).colorScheme.background
          : Colors.blue,
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
                    _show
                        ? SvgPicture.asset(
                            "assets/svg/heartrate.svg",
                            width: 500,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).cardColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            "assets/svg/heartrate.svg",
                            width: 500,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).cardColor.withOpacity(0.5),
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
            totalRound: sessionToLongBreak.toInt(),
            totalGoal: dailyGoal.toInt(),
            curRound: curRound,
            curGoal: curGoal,
          ),
        ],
      ),
    );
  }
}
