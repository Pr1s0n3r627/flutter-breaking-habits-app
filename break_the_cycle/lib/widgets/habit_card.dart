import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;

  HabitCard({required this.habit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(habit.name),
        subtitle: Text('Started: ${habit.startTime}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
