import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  // values in use
  final String task;
  final bool complete;
  Function(bool?)? changed;
  Function(BuildContext)? onDelete;

  ToDoTile({
    super.key,
    required this.task, required this.complete, required this.changed, required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane( // pane comes from the right
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete_forever_rounded,
              backgroundColor: Colors.redAccent.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
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
      ),
    );
  }
}

// custom input dialog
class CustomDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave, onCancel;
  CustomDialog({
    super.key,
    this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    style: BorderStyle.solid
                  )
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  onPressed: onSave,
                  text: 'Save',
                ),

                CustomButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// custom button
class CustomButton extends StatelessWidget {
  // button components
  final String text;
  VoidCallback onPressed;
  CustomButton({
    super.key, 
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.amberAccent[700],
      child: Text(text),
    );
  }
}


