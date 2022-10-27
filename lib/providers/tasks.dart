import 'dart:convert';
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../interfaces/interfaces.dart";

enum UpdateState { loading, success, error, idle }

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];
  var state = UpdateState.idle;

  Tasks() {
    initialState();
  }

  List<Task> get tasks => _tasks;

  void initialState() async {
    state = UpdateState.loading;
    notifyListeners();
    await syncDataWithProvider();
    state = UpdateState.success;
    notifyListeners();
  }

  void add(Task task) {
    _tasks.add(task);
    updateSharedPreferences();
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.removeWhere((element) => element.id == task.id);
    updateSharedPreferences();
    notifyListeners();
  }

  void deleteAll() {
    _tasks.clear();
    updateSharedPreferences();
    notifyListeners();
  }

  void edit(String? id, String newTaskTitle) {
    List<Task> newTasks = [];

    for (final task in _tasks) {
      if (task.id == id) {
        task.title = newTaskTitle;
      }
      newTasks.add(task);
    }

    _tasks = newTasks;

    updateSharedPreferences();
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
  }
}
