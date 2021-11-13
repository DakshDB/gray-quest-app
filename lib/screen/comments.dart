import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/controller/comment_controller.dart';
import 'package:gray_quest/model/bottom_navigation.dart';
import 'package:gray_quest/model/comment_model.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/widget/comment_widget.dart';
import 'package:gray_quest/widget/post_widget.dart';


class CommentScreen extends StatefulWidget {
  final int id;
  CommentScreen({Key? key , required this.id}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState(id);
}

class _CommentScreenState extends State<CommentScreen> {
  int id;
  _CommentScreenState(this.id);


  @override
  void initState() {
    context.read(commentProvider.notifier).getComments(id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        var commentList = watch(commentProvider).data!.value;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "View Comments",
            style: Theme.of(context).textTheme.headline2,
        ),
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
        color: Theme.of(context).textTheme.bodyText2!.color),
        ),
        body: SafeArea(
            child: ListView.separated(
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                return CommentWidget(
                  comment: commentList[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 7,
                );
              },
            )),
      );
      },
    );
  }
}
