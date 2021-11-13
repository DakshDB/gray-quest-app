import 'package:flutter/material.dart';
import 'package:gray_quest/controller/create_post_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/provider/user_id_provider.dart';

import '../theme.dart';
import 'home.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<CreatePostScreen> {
  var _titleController = TextEditingController();
  var _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Post",
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
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height / 30,
                  ),
                  child: Text(
                    "Title",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 30,
                      vertical: 5),
                  child: TextField(
                    controller: _titleController,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).cardColor,
                      filled: true,
                      hintText: "Loreum Ipsum",
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height / 30,
                  ),
                  child: Text(
                    "Post",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 30,
                      vertical: 5),
                  child: TextField(
                    controller: _postController,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).cardColor,
                      filled: true,
                      hintText:
                          "Contrary to popular belief, Lorem Ipsum is not simply random text",
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                    maxLines: 4,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Center(
                    child: MaterialButton(
                        elevation: 6.0,
                        shape: AppTheme.shape,
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.height / 20,
                            vertical: MediaQuery.of(context).size.height / 50),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Submit Post",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          var snackBarText = "Unable to create post";
                          if (await createPost(
                                  _titleController.text,
                                  _postController.text,
                                  context.read(userIdProvider).state) ==
                              201) {
                            snackBarText = "Post created successfully";
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(snackBarText),
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        }))
              ],
            ),
          ),
        ));
  }
}
