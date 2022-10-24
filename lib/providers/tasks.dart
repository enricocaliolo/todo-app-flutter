import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces/interfaces.dart';

class Task extends StatelessWidget {
  String title;

  Task({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(
          '/task',
          arguments: TitleTask(title: title),
        ),
        FocusManager.instance.primaryFocus?.unfocus(),
      },
      child: Dismissible(
        key: Key(title),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            trailing: Wrap(
              spacing: 0,
              children: <IconButton>[
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () => context.read<Tasks>().delete(title),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.check),
                  color: Colors.green,
                  onPressed: () => {},
                )
              ],
            ),
          ),
        ),
        onDismissed: (direction) => context.read<Tasks>().delete(title),
      ),
    );
  }
}

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
