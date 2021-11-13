import 'dart:convert';

import 'package:http/http.dart' as http;

createPost(String title, String post, int userId) async {
  return await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    body: JsonEncoder().convert({
      'title': title,
      'body': post,
      'userId': userId,
    }),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
  ).then((value) {
    return value.statusCode;
  });
}
