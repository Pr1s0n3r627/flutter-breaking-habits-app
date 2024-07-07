import 'package:flutter/material.dart';
import 'theme.dart';
import 'card.dart'; // Ensure HabitCard and Habit are imported

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
      Habit(title: 'Card 4'),
      Habit(title: 'Card 5'),
      Habit(title: 'Card 6'),
      Habit(title: 'Card 7'),
      Habit(title: 'Card 8'),
      Habit(title: 'Card 9'),
      Habit(title: 'Card 10'),
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
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          itemCount: habits.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HabitCard(habit: habits[index]),
            );
          },
        ),
      ),
    );
  }
}
