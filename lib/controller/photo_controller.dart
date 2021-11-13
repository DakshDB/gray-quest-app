import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/model/photo_model.dart';
import 'package:http/http.dart' as http;


final photoProvider = StateNotifierProvider<PhotoController, AsyncValue<List<Photo>>>(
        (ref) => PhotoController(ref.read));

class PhotoController extends StateNotifier<AsyncValue<List<Photo>>> {
  final Reader _reader;

  List<Photo> photos = [];
  PhotoController(this._reader) : super((AsyncData([])));

  getPhotos(int id) async {
    photos.clear();
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'+ id.toString() + '/photos'));
    if (data.statusCode == 200) {
      var photosList = json.decode(data.body) as List;
      for (var photo in photosList) {
        Photo tPhoto = Photo.fromJson(photo);
        photos.add(tPhoto);
      }
    }
    state = AsyncData([...photos]);
  }
}
