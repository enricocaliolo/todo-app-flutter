import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';
import '../interfaces/interfaces.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = context.watch<Tasks>().tasks;

    return GestureDetector(
      // onTap: () {
      //   FocusManager.instance.primaryFocus?.unfocus();
      // },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Center(
            child: Text("Todo List"),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  const CustomForm(
                    action: "submit",
                    hintText: "Digite a task aqui.",
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                    ),
                    onPressed: () => context.read<Tasks>().deleteAll(),
                    child: const Text("CLEAR ALL"),
                  ),
                  const SizedBox(height: 20.0),

                  (context.watch<Tasks>().state == UpdateState.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (context.watch<Tasks>().tasks.isEmpty
                          ? const Center(
                              child: Text(
                                'No tasks',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : Column(
                              children: [
                                const Center(
                                  child: Text(
                                    "Tasks",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TaskListWidget(tasks: tasks),
                                const SizedBox(height: 20.0),
                              ],
                            )))
                  // if()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
