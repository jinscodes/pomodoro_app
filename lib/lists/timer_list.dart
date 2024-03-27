import 'package:flutter/material.dart';

class TimerList extends StatelessWidget {
  final String title;
  final Function handleClick;
  // Future<List<String>?> listItems = getList();

  const TimerList({
    super.key,
    required this.title,
    required this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    // print("list: $listItems");
    return GestureDetector(
      onTap: () {
        handleClick();
      },
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 4),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.timer_outlined,
                  size: 40,
                  color: Theme.of(context).textTheme.displayLarge!.color,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.displayLarge!.color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
