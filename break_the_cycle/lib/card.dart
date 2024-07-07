import 'package:flutter/material.dart';
import 'package:break_the_cycle/theme.dart';

class Habit {
  final String title;

  Habit({required this.title});
}

class HabitCard extends StatelessWidget {
  final Habit habit;

  const HabitCard({Key? key, required this.habit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppTheme.cardColor,
      child: SizedBox(
        width: 350,
        height: 600,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textColor,
                ),
              ),
              // Add more widgets here to display habit details
            ],
          ),
        ),
      ),
    );
  }
}
