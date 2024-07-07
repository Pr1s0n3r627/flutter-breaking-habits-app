import 'package:flutter/material.dart';

class HabitInput extends StatelessWidget {
  final Function(String) onHabitAdded;

  HabitInput({required this.onHabitAdded});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        onSubmitted: onHabitAdded,
        decoration: InputDecoration(
          labelText: 'Enter habit name',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
