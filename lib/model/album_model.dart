class Album {
  int id;
  String title;

  Album({required this.id , required this.title});


  factory Album.fromJson(dynamic map) {
    return Album(id: map['id'], title: map['title']);
  }
}