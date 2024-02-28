import 'package:flutter/material.dart';
import 'package:pomodoro_app/onboarding/step1.dart';
import 'package:pomodoro_app/onboarding/step2.dart';
import 'package:pomodoro_app/onboarding/step3.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void toNextStep(TabController controller) {
    switch (controller.index) {
      case 0:
        controller.animateTo(1);
      case 1:
        controller.animateTo(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20.0),
        child: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Theme.of(context).cardColor,
            title: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(10, 20),
              ),
              onPressed: () {
                print("SKIP button");
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).textTheme.displayLarge!.color,
                ),
              ),
            )),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Step1(
                  controller: tabController,
                ),
                Step2(
                  controller: tabController,
                ),
                const Step3(),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(200, 50),
                alignment: Alignment.center,
                backgroundColor:
                    Theme.of(context).textTheme.displayLarge!.color,
              ),
              onPressed: () {
                toNextStep(tabController);
              },
              child: Text(
                "NEXT",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [
        Step1(
          controller: tabController,
        ),
        Step2(
          controller: tabController,
        ),
        const Step3(),
      ],
    );
  }
}
