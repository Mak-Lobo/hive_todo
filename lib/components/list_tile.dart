import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  // values in use
  final String task;
  final bool complete;
  Function(bool?)? changed;

  ToDoTile({super.key, required this.task, required this.complete, required this.changed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // checkbox
            Checkbox(
              value: complete,
              onChanged: changed,
              activeColor: Colors.amber[800],

            ),
            Text(
              task,
              style: TextStyle(
                decoration: complete
                  ?TextDecoration.lineThrough
                  :TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
