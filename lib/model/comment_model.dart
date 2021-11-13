class Comment {
  String name;
  String comment;
  String emailId;

  Comment({required this.name , required this.comment, required this.emailId});

  factory Comment.fromJson(dynamic map) {
    return Comment(name: map['name'], comment: map['body'], emailId: map['email']);
  }
}