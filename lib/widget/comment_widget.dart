import 'package:flutter/material.dart';
import 'package:gray_quest/model/comment_model.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style:
            Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            comment.emailId,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).cardColor),
          ),
          Text(
            comment.comment,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
