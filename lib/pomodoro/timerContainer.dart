import "package:flutter/material.dart";
import "package:pomodoro_app/pomodoro/timerSetting.dart";

class TimerContainer extends StatefulWidget {
  final String content;
  final double value;
  final bool? isBig;
  final int division;
  final double? max;
  final Function(double) updateSetting;

  const TimerContainer({
    super.key,
    required this.content,
    required this.value,
    this.isBig,
    required this.division,
    this.max,
    required this.updateSetting,
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

  void updateCurValue(double newValue) {
    setState(() {
      curValue = newValue;
    });
  }

  String format(int minutes) {
    var duration = Duration(minutes: minutes);
    return duration.toString().split(".").first.substring(2, 4);
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
            return TimerSetting(
              curValue: curValue,
              division: division,
              updateCurValue: updateCurValue,
              updateSetting: widget.updateSetting,
              max: widget.max,
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
              format(curValue.toInt()),
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
