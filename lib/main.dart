import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home.dart';

void main() async {
  // initializing hive
  await Hive.initFlutter();

  // open box
  await Hive.openBox('tasks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber, // Constant theme for appBar
        ),
      ),
      home: const Home(),
    );
  }
}
