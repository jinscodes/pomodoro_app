import 'package:flutter/material.dart';

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
                  ),
                  TimerContainer(
                    content: "SHORT BREAKS",
                    value: shortBreak,
                  ),
                  TimerContainer(
                    content: "LONG BREAKS",
                    value: longBreak,
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
                  ),
                  TimerContainer(
                    content: "SESSIONS TO LONG BREAK",
                    value: sessionToLongBreak,
                    isBig: true,
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

class TimerContainer extends StatelessWidget {
  final String content;
  final double value;
  final bool? isBig;

  const TimerContainer({
    super.key,
    required this.content,
    required this.value,
    this.isBig,
  });

  @override
  Widget build(BuildContext context) {
    double boxSize = isBig == true ? 160 : 105;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return TimerSetting(
              currentValue: value,
            );
          },
        );
      },
      child: Container(
        width: boxSize,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$value",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerSetting extends StatefulWidget {
  final double currentValue;

  const TimerSetting({
    super.key,
    required this.currentValue,
  });

  @override
  State<TimerSetting> createState() => _TimerSettingState();
}

class _TimerSettingState extends State<TimerSetting> {
  @override
  Widget build(BuildContext context) {
    double currentValue = widget.currentValue;

    return Container(
      height: 200,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$currentValue",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("DONE");
                    },
                    child: Text(
                      "DONE",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Slider(
              max: 60,
              value: currentValue,
              onChanged: (double curValue) {
                setState(() {
                  currentValue = curValue;
                });
              },
              divisions: 10,
              // label: ,
            )
          ],
        ),
      ),
    );
  }
}
