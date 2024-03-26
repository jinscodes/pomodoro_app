import 'package:flutter/material.dart';
import 'package:pomodoro_app/lists/timer_list.dart';

class TimerListScreen extends StatelessWidget {
  const TimerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TimerList(),
        ),
      ),
    );
  }
}
