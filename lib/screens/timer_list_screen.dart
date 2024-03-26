import 'package:flutter/material.dart';
import 'package:pomodoro_app/lists/timer_list.dart';

class TimerListScreen extends StatelessWidget {
  const TimerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/image/list.png"),
              const SizedBox(
                height: 30,
              ),
              TimerList(
                title: "Study Routine1",
                handleClick: () => print("onTab"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
