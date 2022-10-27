import "package:flutter/material.dart";

import "../interfaces/interfaces.dart";
import "../widgets/form.dart";

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit task"),
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
              Center(
                child: Text(
                  args.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomForm(
                action: "edit",
                hintText: "Enter the new name of the task.",
                taskTitle: args.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
