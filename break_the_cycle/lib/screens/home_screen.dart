import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../services/habit_service.dart';
import '../widgets/habit_input.dart';
import '../widgets/habit_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Break the Cycle'),
      ),
      body: Column(
        children: <Widget>[
          HabitInput(onHabitAdded: _addHabit),
          Expanded(
            child: ListView.builder(
              itemCount: _habits.length,
              itemBuilder: (context, index) {
                return HabitCard(habit: _habits[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
