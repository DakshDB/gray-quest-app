import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/model/user_model.dart';
import 'package:http/http.dart' as http;



final profileProvider = StateNotifierProvider<ProfileController, User>(
        (ref) => ProfileController(ref.read));



class ProfileController extends StateNotifier<User> {
  final Reader _reader;

  ProfileController(this._reader) : super((User()));

  getUserProfile(int id) async {
    var data = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users/' + id.toString()));
    if (data.statusCode == 200) {
      var jsonData = json.decode(data.body);
      User tUser = User.fromJson(jsonData);
      state = tUser;
    }
  }
}
