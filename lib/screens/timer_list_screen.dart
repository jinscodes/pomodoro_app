import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/lists/timer_list.dart';
import 'package:pomodoro_app/provider/get_list.dart';

class TimerListScreen extends StatelessWidget {
  const TimerListScreen({super.key});

  encodeList(String list) {
    dynamic listToJson = jsonDecode(list);

    return listToJson;
  }

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
              FutureBuilder(
                future: getList(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, idx) {
                            print("snapshot.data[idx]: ${snapshot.data![idx]}");
                            print("snapshot: ${snapshot.data}");
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: TimerList(
                                title: "title $idx",
                                handleClick: () => print("$idx"),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
