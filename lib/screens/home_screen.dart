import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/timer.png"),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "1",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
