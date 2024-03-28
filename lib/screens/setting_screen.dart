import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/button.dart';
import 'package:pomodoro_app/pomodoro/timerContainer.dart';
import 'package:pomodoro_app/provider/get_list.dart';
import 'package:pomodoro_app/screens/pomodoro_screen.dart';
import 'package:pomodoro_app/screens/timer_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        ),
      ),
    );
  }

  saveTimer() async {
    await _saveDialog();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? list = await getList();

    String settings = {
      "sessions": sessions,
      "short": shortBreak,
      "long": longBreak,
      "dg": dailyGoal,
      "stlb": sessionToLongBreak,
    }.toString();

    list!.add(settings);

    await prefs.setStringList("list", list);
  }

  Future<void> _saveDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: Column(
            children: [
              // const Icon(
              //   Icons.check_circle_outline_rounded,
              //   color: Colors.green,
              //   size: 60,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Text(
                'Title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextField(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimerListScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.list_outlined,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
            IconButton(
              onPressed: () {
                saveTimer();
                print("ICON save");
              },
              icon: Icon(
                Icons.save_alt_outlined,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
          ],
        ),
      ),
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
