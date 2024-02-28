import 'package:flutter/material.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TAKE A BREAK",
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
                  "Regain your energy and take a short break",
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
                Image.asset("assets/image/dancingDoodle.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
