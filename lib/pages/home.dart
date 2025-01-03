import 'package:flutter/material.dart';
import 'package:hive_todo/components/list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // to-do task list
  List toDolist = [
    ["Make tutorial", false],
    ['Make cake', true]
  ];

  // function for checkbox changes
  void checkChanged(bool? val, int i) {
    setState(() {
      toDolist[i][1] = !toDolist[i][1];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text('TO DO app'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, i) {
          return ToDoTile(
              task: toDolist[i][0],
              complete: toDolist[i][1],
              changed: (val) => checkChanged(val, i),
          );
        },
      ),
    );
  }
}
