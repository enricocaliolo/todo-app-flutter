import 'package:flutter/material.dart';

import '../interfaces/interfaces.dart';
import '../widgets/form.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TitleTask;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit task'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              CustomForm(
                action: 'edit',
                taskTitle: args.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
