class Photo {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory Photo.fromJson(dynamic map) {
    return Photo(
        albumId: map['albumId'],
        id: map['id'],
        title: map['title'],
        url: map['url'],
        thumbnailUrl: map['thumbnailUrl']);
  }
}
