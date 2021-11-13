import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/model/photo_model.dart';
import 'package:gray_quest/model/todo_model.dart';
import 'package:http/http.dart' as http;


final todoProvider = StateNotifierProvider<TodoController, AsyncValue<List<Todo>>>(
        (ref) => TodoController(ref.read));

class TodoController extends StateNotifier<AsyncValue<List<Todo>>> {
  final Reader _reader;

  List<Todo> todos = [];
  TodoController(this._reader) : super((AsyncData([])));

  getTodos(int id) async {
    todos.clear();
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'+ id.toString() + '/todos'));
    if (data.statusCode == 200) {
      var todoList = json.decode(data.body) as List;
      for (var todo in todoList) {
        Todo tTodo = Todo.fromJson(todo);
        todos.add(tTodo);
      }
    }
    state = AsyncData([...todos]);
  }
}
