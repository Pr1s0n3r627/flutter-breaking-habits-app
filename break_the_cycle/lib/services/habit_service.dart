import '../models/habit.dart';

class HabitService {
  // Dummy data for now
  Future<List<Habit>> loadHabits() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate loading delay
    return [
      Habit(name: 'Exercise', startTime: DateTime.now()),
      Habit(name: 'Meditation', startTime: DateTime.now()),
      Habit(name: 'Reading', startTime: DateTime.now()),
    ];
  }

  void saveHabit(Habit habit) {
    // Implement saving logic here
  }
}
