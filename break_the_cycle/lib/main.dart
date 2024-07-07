import 'package:flutter/material.dart';
import 'theme.dart'; // Ensure AppTheme is imported

class Habit {
  final String title;

  Habit({required this.title});
}

class HabitCard extends StatefulWidget {
  final Habit habit;

  const HabitCard({Key? key, required this.habit}) : super(key: key);

  @override
  _HabitCardState createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _highlighted = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _highlighted = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _highlighted = false;
        });
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1.0, end: 0.95),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (context, scale, child) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform: Matrix4.identity()..scale(scale),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _highlighted ? AppTheme.primaryColor : AppTheme.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              widget.habit.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _highlighted ? Colors.white : AppTheme.textColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
