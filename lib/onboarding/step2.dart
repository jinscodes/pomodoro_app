import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "JUST FOCUS",
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
                  "Concentrate fully on your work",
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
                Image.asset("assets/image/readingDoodle.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
