class Post {
  int id;
  String title;
  String content;

  Post({required this.id, required this.title, required this.content});

  factory Post.fromJson(dynamic map) {
    return Post(content: map['body'], title: map['title'], id: map['id']);
  }
}
