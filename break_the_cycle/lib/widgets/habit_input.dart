import 'package:flutter/material.dart';

class HabitInput extends StatefulWidget {
  final Function(String) onHabitAdded;

  HabitInput({required this.onHabitAdded});

  @override
  _HabitInputState createState() => _HabitInputState();
}

class _HabitInputState extends State<HabitInput> {
  final _controller = TextEditingController();

  void _submit() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      widget.onHabitAdded(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter habit'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _submit,
        ),
      ],
    );
  }
}
