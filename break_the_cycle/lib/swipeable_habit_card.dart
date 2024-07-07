import 'package:flutter/material.dart';
import 'card.dart'; // Ensure HabitCard is imported

class SwipeableHabitCard extends StatelessWidget {
  final List<Habit> habits;

  const SwipeableHabitCard({Key? key, required this.habits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: habits.map((habit) {
        return Center(
          child: HabitCard(habit: habit),
        );
      }).toList(),
    );
  }
}
