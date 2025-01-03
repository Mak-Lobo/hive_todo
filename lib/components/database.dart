import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  // referring to the database
  final _myData = Hive.box('tasks');

  // task lists
  List toDoList = [];

  // methods to initialize, create and delete tasks
  // initial data
  void initialData () {
    toDoList = [
      ['Make tutorial', false],
      ['Make cake', false]
    ];
  }

  // load the data from database
  void loadData () {
    toDoList = _myData.get('List');
  }

  // update database
  void updateData () {
    _myData.put('List', toDoList);
  }
}