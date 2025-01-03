import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/components/custom widgets.dart';
import 'package:hive_todo/components/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // opening Hive box
  final _box = Hive.box('tasks');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // default value for the first-time installation
    if (_box.get('List') == null) {
      db.initialData();
    } else {
      db.loadData(); // already installed and opened
    }
    super.initState();
  }
  // function for checkbox changes
  void checkChanged(bool? val, int i) {
    setState(() {
      db.toDoList[i][1] = !db.toDoList[i][1];
    });
    db.updateData(); // dynamic update
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
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  //deleting a task
  void deleteTask (int item) {
    setState(() {
      db.toDoList.removeAt(item);
    });
    db.updateData();
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
      body: (db.toDoList.isNotEmpty) ? ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, i) {
          return ToDoTile(
            task: db.toDoList[i][0],
            complete: db.toDoList[i][1],
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
