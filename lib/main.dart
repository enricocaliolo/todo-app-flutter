import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/tasks.dart';
import './providers/providers.dart';
import './screens/screens.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Tasks()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<Tasks>().initialState();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/task': (context) => const TaskScreen(),
      },
    );
  }
}
