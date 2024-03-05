import "package:flutter/material.dart";

class TimerContainer extends StatefulWidget {
  final String content;
  final double value;
  final bool? isBig;
  final int division;

  const TimerContainer({
    super.key,
    required this.content,
    required this.value,
    this.isBig,
    required this.division,
  });

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  late double curValue;

  @override
  void initState() {
    curValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boxSize = widget.isBig == true ? 160 : 105;
    int division = widget.division;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 180,
              width: 600,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${curValue.toInt()}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      max: 60,
                      divisions: division,
                      value: curValue,
                      onChanged: (double value) {
                        setState(() {
                          curValue = value;
                        });
                        print("value: $value");
                        print("curValue: $curValue");
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: boxSize,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${curValue.toInt()}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.content,
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
