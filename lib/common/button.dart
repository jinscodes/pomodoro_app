import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String content;
  final Function handleClick;

  const Button({super.key, required this.handleClick, required this.content});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(200, 50),
        alignment: Alignment.center,
        backgroundColor: Theme.of(context).textTheme.displayLarge!.color,
      ),
      onPressed: () {
        handleClick();
      },
      child: Text(
        content,
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
