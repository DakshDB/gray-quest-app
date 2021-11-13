import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/model/comment_model.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:http/http.dart' as http;


final albumProvider = StateNotifierProvider<AlbumController, AsyncValue<List<Album>>>(
        (ref) => AlbumController(ref.read));

class AlbumController extends StateNotifier<AsyncValue<List<Album>>> {
  final Reader _reader;

  final List<Album> albumList = [];

  AlbumController(this._reader) : super((AsyncData([])));

  getAlbums(int id) async {
    albumList.clear();
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'+ id.toString() + '/albums'));
    if (data.statusCode == 200) {
      var albumsList = json.decode(data.body) as List;
      for (var album in albumsList) {
        Album tAlbum = Album.fromJson(album);
        albumList.add(tAlbum);
      }
    }
    state = AsyncData([...albumList]);
  }
}
