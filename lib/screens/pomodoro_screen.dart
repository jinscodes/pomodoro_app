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
  late int totalSecond;

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
    if (sessions == 0) {
      setState(() {
        dailyGoal = dailyGoal + 1;
        isRunning = false;
        totalSecond = widget.sessions.toInt() * 60;
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
              child: Text(
                format(totalSecond),
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
          Container(
            width: 600,
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(),
                            child: Text(
                              "ROUND",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "/4",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .color!
                            .withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(),
                            child: Text(
                              "GOAL",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "/4",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Flexible(
//                         flex: 1,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.blue,
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "ROUND",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .displayLarge!
//                                       .color,
//                                 ),
//                               ),
//                               Text(
//                                 "${dailyGoal.toInt()}",
//                                 style: TextStyle(
//                                   fontSize: 60,
//                                   fontWeight: FontWeight.w600,
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .displayLarge!
//                                       .color,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Flexible(
//                         flex: 1,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Colors.amber,
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "GOAL",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .displayLarge!
//                                       .color,
//                                 ),
//                               ),
//                               Text(
//                                 "${dailyGoal.toInt()}",
//                                 style: TextStyle(
//                                   fontSize: 60,
//                                   fontWeight: FontWeight.w600,
//                                   color: Theme.of(context)
//                                       .textTheme
//                                       .displayLarge!
//                                       .color,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),