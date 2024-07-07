import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../services/habit_service.dart';
import '../widgets/habit_input.dart';
import '../widgets/habit_card.dart';
import '../utils/theme.dart'; // Import the theme.dart file

class HabitScreen extends StatefulWidget {
  @override
  _HabitScreenState createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  final HabitService _habitService = HabitService();
  List<Habit> _habits = [];

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    final habits = await _habitService.loadHabits();
    setState(() {
      _habits = habits;
    });
  }

  void _addHabit(String name) {
    final newHabit = Habit(name: name, startTime: DateTime.now());
    _habitService.saveHabit(newHabit);
    setState(() {
      _habits.add(newHabit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _habits.length,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Break the Cycle'),
              bottom: TabBar(
                isScrollable: true,
                tabs: _habits.map((habit) {
                  return Tab(text: habit.name);
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: _habits.map((habit) {
                return Theme(
                  data: getHabitTheme(habit.name), // Use the custom habit-specific theme
                  child: Column(
                    children: <Widget>[
                      HabitInput(onHabitAdded: _addHabit),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 1, // Each tab only shows one habit
                          itemBuilder: (context, index) {
                            return HabitCard(habit: habit);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
