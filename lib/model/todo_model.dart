class Todo {
  int id;
  int userId;
  String title;
  bool completed;

  Todo({required this.title,
    required this.id,
    required this.userId,
    required this.completed});

  factory Todo.fromJson(dynamic map) {
    return Todo(
        id: map['id'],
        userId: map['userId'],
        title: map['title'],
        completed: map['completed']);
  }
}
