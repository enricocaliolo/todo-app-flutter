import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../interfaces/interfaces.dart';
import '../providers/providers.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(
          '/task',
          arguments: Task(id: task.id, title: task.title),
        ),
        FocusManager.instance.primaryFocus?.unfocus(),
      },
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
            task.title,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: Wrap(
            spacing: 0,
            children: <IconButton>[
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => context.read<Tasks>().delete(task),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
