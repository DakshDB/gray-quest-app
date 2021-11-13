import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/controller/photo_controller.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/model/bottom_navigation.dart';
import 'package:gray_quest/model/comment_model.dart';
import 'package:gray_quest/model/photo_model.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/widget/comment_widget.dart';
import 'package:gray_quest/widget/photo_widget.dart';
import 'package:gray_quest/widget/post_widget.dart';


class PhotosScreen extends StatefulWidget {

  final Album album;
  PhotosScreen({Key? key, required this.album}) : super(key: key);

  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {

  @override
  void initState() {
    super.initState();
    context.read(photoProvider.notifier).getPhotos(widget.album.id);

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, watch, child) {
          var photosList = watch(photoProvider).data;
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.album.title, style: Theme
                  .of(context)
                  .textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Theme
                  .of(context)
                  .accentColor,
              iconTheme: IconThemeData(color: Theme
                  .of(context).textTheme.headline1!.color),
            ),
            body: SafeArea(
                child: ListView.separated(
                  itemCount: photosList!.value.length,
                  itemBuilder: (context, index) {
                    return PhotoWidget(photo: photosList.value[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 1,
                    );
                  },
                )
            ),

          );
        }
    );
  }
}
