import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:http/http.dart' as http;


final postProvider = StateNotifierProvider<PostController, AsyncValue<List<Post>>>(
    (ref) => PostController(ref.read));

class PostController extends StateNotifier<AsyncValue<List<Post>>> {
  final Reader _reader;

  final List<Post> postList = [];
  PostController(this._reader) : super((AsyncData([])));

  getPosts() async {
    postList.clear();
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (data.statusCode == 200) {
      var postsList = json.decode(data.body) as List;
      for (var post in postsList) {
        Post tPost = Post.fromJson(post);
        postList.add(tPost);
      }
      }
    state = AsyncData([...postList]);
    }
}
