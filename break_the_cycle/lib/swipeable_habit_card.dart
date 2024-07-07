import 'package:flutter/material.dart';
import 'card.dart'; // Ensure HabitCard is imported

class SwipeableHabitCard extends StatefulWidget {
  final List<Habit> habits;

  const SwipeableHabitCard({Key? key, required this.habits}) : super(key: key);

  @override
  _SwipeableHabitCardState createState() => _SwipeableHabitCardState();
}

class _SwipeableHabitCardState extends State<SwipeableHabitCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  List<Habit> habitStack = [];
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.habits.isNotEmpty) {
      habitStack.add(widget.habits[currentCardIndex]);
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.5, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _handleSwipe(DismissDirection direction) {
    setState(() {
      if (direction == DismissDirection.endToStart) {
        if (currentCardIndex > 0) {
          currentCardIndex--;
        }
      } else if (direction == DismissDirection.startToEnd) {
        currentCardIndex++;
        if (currentCardIndex >= widget.habits.length) {
          currentCardIndex = 0; // Wrap around to the first card
        }
      }
      habitStack.clear();
      habitStack.add(widget.habits[currentCardIndex]);
    });

    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: habitStack.map((habit) {
        return SlideTransition(
          position: _slideAnimation,
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                _handleSwipe(DismissDirection.startToEnd);
              } else if (details.primaryVelocity! < 0) {
                _handleSwipe(DismissDirection.endToStart);
              }
            },
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) => _handleSwipe(direction),
              child: HabitCard(habit: habit),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
