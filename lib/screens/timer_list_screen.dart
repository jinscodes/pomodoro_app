import 'dart:convert';

import 'package:flutter/material.dart';
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
                    print("waiting");
                  } else {
                    print("data: ${snapshot.data}");
                    // dynamic jsonList = json.decode(snapshot.data);

                    return LayoutBuilder(builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("LIST1"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  }

                  return const Text("FUTURE BUILDER");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
