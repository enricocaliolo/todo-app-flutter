import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<Tasks>().tasks;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Center(
            child: Text('Todo List'),
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                const CustomForm(
                  action: 'submit',
                ),
                const SizedBox(height: 20.0),
                const Center(
                  child: Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: context.watch<Tasks>().tasks.length,
                    itemBuilder: (context, index) {
                      final item = tasks[index];
                      return item;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
