import "package:flutter/material.dart";

class TimerSetting extends StatefulWidget {
  final double curValue;
  final int division;

  const TimerSetting({
    super.key,
    required this.curValue,
    required this.division,
  });

  @override
  State<TimerSetting> createState() => _TimerSettingState();
}

class _TimerSettingState extends State<TimerSetting> {
  double test = 10;
  late double curValue;

  @override
  void initState() {
    curValue = widget.curValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 600,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
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
              divisions: widget.division,
              value: curValue,
              onChanged: (double value) {
                setState(() {
                  curValue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
