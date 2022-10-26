import 'dart:convert';

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../interfaces/interfaces.dart";
import "package:shared_preferences/shared_preferences.dart";

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];

  Tasks() {
    initialState();
  }

  List get tasks => _tasks;

  void initialState() {
    syncDataWithProvider();
  }

  void add(Task task) {
    _tasks.add(task);
    updateSharedPreferences();
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.removeWhere((element) => element.title == task.title);
    updateSharedPreferences();
    notifyListeners();
  }

  void deleteAll() {
    _tasks.clear();
    updateSharedPreferences();
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

  int getTaskLength() {
    return _tasks.length;
  }

  Future updateSharedPreferences() async {
    List<String> myTasks =
        _tasks.map((task) => json.encode(task.toJson())).toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('tasks', myTasks);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('tasks');

    if (result != null) {
      _tasks = result.map((task) => Task.fromJson(json.decode(task))).toList();
    }

    notifyListeners();
  }
}
