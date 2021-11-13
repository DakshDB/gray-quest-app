
import 'package:flutter/material.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/model/comment_model.dart';
import 'package:gray_quest/model/photo_model.dart';
import 'package:gray_quest/screen/photos.dart';
import 'package:gray_quest/theme.dart';


class PhotoWidget extends StatelessWidget {

  final Photo photo;

  const PhotoWidget({Key? key, required this.photo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Card(
        shape: AppTheme.cardShape,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Theme.of(context).accentColor,
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(photo.url, width: MediaQuery.of(context).size.width,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(photo.title, style: Theme.of(context).textTheme.caption,),
            ),
          ],
        ),
      ),
    );

  }
}

