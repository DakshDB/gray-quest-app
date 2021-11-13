import 'package:flutter/material.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/screen/comments.dart';
import 'package:gray_quest/screen/login.dart';

import '../theme.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({Key? key, required this.post}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            post.content,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w300),
          ),
          TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.only(top: 5),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "view comments",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommentScreen(id: post.id)));
              })
        ],
      ),
    );
  }
}
