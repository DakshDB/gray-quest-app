import 'package:flutter/material.dart';
import 'package:gray_quest/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style:
              Theme.of(context).textTheme.headline2
            ),
            todo.completed
                ? Text(
              'Completed',
              style: TextStyle(color: Colors.green, fontSize: 16),
            )
                : Text(
              'Incomplete',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
