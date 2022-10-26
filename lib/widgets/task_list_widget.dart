import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../interfaces/interfaces.dart';
import './task_widget.dart';
import '../providers/providers.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //                           scrollDirection: Axis.vertical,
    //                           shrinkWrap: true,
    //                           itemCount: context.watch<Tasks>().tasks.length,
    //                           itemBuilder: (context, index) {
    //                             final Task task = tasks[index];
    //                             return TaskWidget(task: task);
    //                           },
    //                         )
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: context.watch<Tasks>().tasks.length,
      itemBuilder: (context, index) {
        final Task task = tasks[index];
        return TaskWidget(task: task);
      },
    );
  }
}
