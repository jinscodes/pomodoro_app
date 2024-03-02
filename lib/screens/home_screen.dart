import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimerContainer(
                    content: "SESSIONS",
                    value: 25,
                  ),
                  TimerContainer(
                    content: "SHORT BREAKS",
                    value: 5,
                  ),
                  TimerContainer(
                    content: "LONG BREAKS",
                    value: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimerContainer(
                    content: "DAILY GOAL",
                    value: 4,
                    isBig: true,
                  ),
                  TimerContainer(
                    content: "SESSIONS TO LONG BREAK",
                    value: 2,
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
  final int value;
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
            return Container(
              height: 200,
              width: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Column(
                children: [
                  Text("25"),
                ],
              ),
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
