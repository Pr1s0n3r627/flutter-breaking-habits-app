import 'package:flutter/material.dart';
import 'theme.dart';
import 'swipeable_habit_card.dart';
import 'card.dart'; // Ensure Habit is imported

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Break the Habits',
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Habit> habits = [
      Habit(title: 'Card 1'),
      Habit(title: 'Card 2'),
      Habit(title: 'Card 3'),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.boneColor, AppTheme.brownColor],
          ),
        ),
        child: Center(
          child: SwipeableHabitCard(habits: habits),
        ),
      ),
    );
  }
}
