import 'package:flutter/material.dart';
import '../models/habit.dart';
import 'package:intl/intl.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;

  HabitCard({required this.habit});

  @override
  Widget build(BuildContext context) {
    final duration = DateTime.now().difference(habit.startTime);
    return Card(
      child: ListTile(
        title: Text(habit.name),
        subtitle: Text('Started: ${DateFormat.yMMMd().format(habit.startTime)}'),
        trailing: Text('${duration.inDays} days'),
      ),
    );
  }
}
