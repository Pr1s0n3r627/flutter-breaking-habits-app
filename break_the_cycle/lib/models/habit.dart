// lib/models/habit.dart
class Habit {
  String id;
  String name;
  DateTime startTime;
  bool isCompleted;

  Habit({
    required this.id,
    required this.name,
    required this.startTime,
    this.isCompleted = false,
  });

  factory Habit.fromMap(Map<String, dynamic> data) {
    return Habit(
      id: data['id'],
      name: data['name'],
      startTime: data['startTime'].toDate(),
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'startTime': startTime,
      'isCompleted': isCompleted,
    };
  }
}
