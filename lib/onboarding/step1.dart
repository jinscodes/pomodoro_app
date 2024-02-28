import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  const Step1({
    super.key,
  });

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HOW TO USE",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  textAlign: TextAlign.center,
                  "Choose a task that you need to complete",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/image/unboxingDoodle.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
