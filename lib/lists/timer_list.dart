import 'package:flutter/material.dart';

class TimerList extends StatelessWidget {
  const TimerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: [
            Icon(
              Icons.timer_outlined,
              size: 40,
              color: Theme.of(context).textTheme.displayLarge!.color,
            ),
          ],
        ),
      ),
    );
  }
}
