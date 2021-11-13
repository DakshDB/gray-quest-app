import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/model/comment_model.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:http/http.dart' as http;


final commentProvider = StateNotifierProvider<CommentController, AsyncValue<List<Comment>>>(
        (ref) => CommentController(ref.read));

class CommentController extends StateNotifier<AsyncValue<List<Comment>>> {
  final Reader _reader;

  List<Comment> commentsList = [];
  CommentController(this._reader) : super((AsyncData([])));

  getComments(int id) async {
    commentsList.clear();
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'+ id.toString() + '/comments'));
    if (data.statusCode == 200) {
      var commentList = json.decode(data.   body) as List;
      for (var comment in commentList) {
        Comment tComment = Comment.fromJson(comment);
        commentsList.add(tComment);
      }
    }
    state = AsyncData([...commentsList]);
  }
}
