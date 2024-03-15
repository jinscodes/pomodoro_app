import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodoro_app/pomodoro/bottomContainer.dart';
import 'package:pomodoro_app/screens/setting_screen.dart';

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
  late int sessions;
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
    sessions = widget.sessions.toInt() * 60;
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
      if (step == "sessions") {
        if (curRound + 1 == sessionToLongBreak) {
          if (curGoal + 1 == dailyGoal) {
            print("done");
            setState(() {
              curRound = 0;
              curGoal = 0;
              totalSecond = 0;
              step = "sessions";
            });
            _showMyDialog();
          } else {
            setState(() {
              curRound = 0;
              curGoal = curGoal + 1;
              totalSecond = longBreak;
              step = "longbreak";
            });
          }
        } else {
          setState(() {
            curRound = curRound + 1;
            totalSecond = shortBreak;
            step = "shortbreak";
          });
        }
      } else if (step == "shortbreak") {
        setState(() {
          step = "sessions";
          totalSecond = sessions;
        });
      } else {
        setState(() {
          step = "sessions";
          totalSecond = sessions;
        });
      }

      setState(() {
        isRunning = false;
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

  void toSettingScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SettingScreen()));
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: Column(
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'CONGRATULATION!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'You done your all rounds and goals.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
                Text(
                  'Do you want to return to the setting screen?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('YES'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: Column(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'WARNING!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Returning to the setting screen, it is reset.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('YES'),
              onPressed: () {
                Navigator.of(context).pop();
                toSettingScreen();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: step == "sessions"
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).textTheme.displayLarge!.color,
      appBar: AppBar(
        backgroundColor: step == "sessions"
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).textTheme.displayLarge!.color,
        leading: IconButton(
          onPressed: () {
            _showAlertDialog();
          },
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).cardColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                ],
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



// PopupMenuButton<String>(
//             itemBuilder: (BuildContext context) {
//               return {'Logout', 'Settings'}.map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),