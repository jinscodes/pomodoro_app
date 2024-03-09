import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  final int totalRound;
  final int totalGoal;
  final int curRound;
  final int curGoal;

  const BottomContainer(
      {super.key,
      required this.totalRound,
      required this.totalGoal,
      required this.curRound,
      required this.curGoal});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  late int totalRound;
  late int totalGoal;
  // late int curRound;
  // late int curGoal;

  @override
  void initState() {
    totalRound = widget.totalRound;
    totalGoal = widget.totalGoal;
    // curRound = widget.curRound;
    // curGoal = widget.curGoal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int curRound = widget.curRound;
    int curGoal = widget.curGoal;

    return Container(
      width: 600,
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(),
                      child: Text(
                        "ROUND",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$curRound",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "/$totalRound",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: SizedBox(
              width: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .color!
                      .withOpacity(0.8),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(),
                      child: Text(
                        "GOAL",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$curGoal",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "/$totalGoal",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
