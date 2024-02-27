import 'package:flutter/material.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        Flexible(
          flex: 3,
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
      ],
    );
  }
}
