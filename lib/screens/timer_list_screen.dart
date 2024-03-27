import 'package:flutter/material.dart';
import 'package:pomodoro_app/lists/timer_list.dart';

class TimerListScreen extends StatefulWidget {
  const TimerListScreen({super.key});

  @override
  State<TimerListScreen> createState() => _TimerListScreenState();
}

class _TimerListScreenState extends State<TimerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/image/list.png"),
              const SizedBox(
                height: 30,
              ),
              TimerList(
                title: "Study Routine1",
                handleClick: () => print("onTab"),
              ),
              // FutureBuilder(
              //     future: getList(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const CircularProgressIndicator();
              //       } else if (snapshot.hasError) {
              //         return Text("Err: ${snapshot.error}");
              //       } else {
              //         List<String>? list = snapshot.data;
              //         print("LIST: $list");

              //         return ListView.builder(
              //           itemCount: list!.length,
              //           itemBuilder: (context, index) {
              //             return Text(list[index]);
              //           },
              //         );
              //       }
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
