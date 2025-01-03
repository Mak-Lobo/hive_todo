import 'package:flutter/material.dart';
import 'package:hive_todo/components/custom widgets.dart';

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

  // controller variable
  final _controller = TextEditingController();

  // creating new task through dialog
  void newTask () {
    showDialog(context: context, builder: (context) {
      return CustomDialog(
        controller: _controller,
        onSave: saveTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  // saving a task
  void saveTask () {
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //deleting a task
  void deleteTask (int item) {
    setState(() {
      toDolist.removeAt(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text('TO DO app'),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: (toDolist.isNotEmpty) ? ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, i) {
          return ToDoTile(
            task: toDolist[i][0],
            complete: toDolist[i][1],
            changed: (val) => checkChanged(val, i),
            onDelete: (context) => deleteTask(i),
          );
        },
      ) : const Center(
        child: Text("No tasks saved"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        child: const Icon(Icons.add_task_outlined),
      ),
    );
  }
}
