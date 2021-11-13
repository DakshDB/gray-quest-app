import 'package:flutter/material.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/screen/photos.dart';
import 'package:gray_quest/theme.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;

  const AlbumWidget({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PhotosScreen(album: album)));
      },
      child: Card(
        shape: AppTheme.cardShape,
        color: Theme.of(context).accentColor,
        child: Container(
          height: MediaQuery.of(context).size.height/10,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  album.title,
                  style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, color: Theme.of(context).secondaryHeaderColor,),
            ],
          ),
        ),
      ),
    );
  }
}
