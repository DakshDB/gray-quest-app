import 'package:flutter/material.dart';
import 'package:gray_quest/controller/post_contoller.dart';
import 'package:gray_quest/model/bottom_navigation.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/screen/create_post.dart';
import 'package:gray_quest/widget/post_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    super.initState();
    context.read(postProvider.notifier).getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
    builder: (context, watch, child) {

        final posts = watch(postProvider).data!.value;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).accentColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/30,),
                        Text(
                          "Posts",
                          style: Theme.of(context)
                              .textTheme.headline1
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/30,),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: Theme.of(context)
                            .textTheme.headline3,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(post: posts[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.white,
                        thickness: 1.5,
                        indent: MediaQuery.of(context).size.width / 10,
                        endIndent: MediaQuery.of(context).size.width / 10,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreatePostScreen()));
              }),
        );
    },
    );
  }
}
