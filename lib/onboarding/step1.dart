import 'package:flutter/material.dart';

class Step1 extends StatelessWidget {
  const Step1({
    super.key,
  });

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
                SizedBox(
                  height: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/image/step1.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).textTheme.displayLarge!.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  print("NEXT button");
                },
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
