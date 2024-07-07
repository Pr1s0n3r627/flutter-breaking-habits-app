import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/habit.dart';

class HabitService {
  Future<void> saveHabit(Habit habit) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> habitList = prefs.getStringList('habits') ?? [];
    habitList.add(jsonEncode({'name': habit.name, 'startTime': habit.startTime.toIso8601String()}));
    await prefs.setStringList('habits', habitList);
  }

  Future<List<Habit>> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> habitList = prefs.getStringList('habits') ?? [];
    return habitList.map((item) {
      Map<String, dynamic> json = jsonDecode(item);
      return Habit(name: json['name'], startTime: DateTime.parse(json['startTime']));
    }).toList();
  }
}
