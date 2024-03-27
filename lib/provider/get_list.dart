import 'package:shared_preferences/shared_preferences.dart';

class Routine {
  String title;
  int sessions;
  int shortBreak;
  int longBreak;
  int dailyGoal;
  int stlb;

  Routine({
    required this.title,
    required this.sessions,
    required this.shortBreak,
    required this.longBreak,
    required this.dailyGoal,
    required this.stlb,
  });
}

Future<List<String>?> getList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String>? items = prefs.getStringList("list");

  // print("items: $items");

  return items;
}
