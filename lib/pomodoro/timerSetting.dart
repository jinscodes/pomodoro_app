import "package:flutter/material.dart";

class TimerSetting extends StatefulWidget {
  final double curValue;
  final int division;
  final Function(double) updateCurValue;
  final Function(double) updateSetting;

  final double? max;

  const TimerSetting({
    super.key,
    required this.curValue,
    required this.division,
    this.max,
    required this.updateCurValue,
    required this.updateSetting,
  });

  @override
  State<TimerSetting> createState() => _TimerSettingState();
}

class _TimerSettingState extends State<TimerSetting> {
  double settingValue = 0;

  @override
  void initState() {
    settingValue = widget.curValue;
    super.initState();
  }

  void setValue() {
    if (settingValue == 0) {
      return showSnackBar(context, "0 is not accepted");
    }
    widget.updateCurValue(settingValue);
    widget.updateSetting(settingValue);
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
                    "${settingValue.toInt()}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "DONE",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                    onPressed: () {
                      setValue();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Slider(
              max: widget.max == null ? 60.0 : widget.max!,
              divisions: widget.division,
              value: settingValue,
              activeColor: Theme.of(context).textTheme.displayLarge!.color,
              onChanged: (double value) {
                setState(() {
                  settingValue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
