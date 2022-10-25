import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces/interfaces.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];

  List get tasks => _tasks;

  void add(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void delete(String title) {
    _tasks.removeWhere((element) => element.title == title);
    notifyListeners();
  }

  void edit(String? taskTitle, String newTaskTitle) {
    List<Task> newTasks = [];

    for (final task in _tasks) {
      if (task.title == taskTitle) {
        task.title = newTaskTitle;
      }
      newTasks.add(task);
    }

    _tasks = newTasks;

    notifyListeners();
  }
}
