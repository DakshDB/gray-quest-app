import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/controller/album_controller.dart';
import 'package:gray_quest/model/album_model.dart';
import 'package:gray_quest/model/bottom_navigation.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/provider/user_id_provider.dart';
import 'package:gray_quest/widget/album_widget.dart';
import 'package:gray_quest/widget/post_widget.dart';


class AlbumScreen extends StatefulWidget {
  AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {

  @override
  void initState() {
    super.initState();
    context.read(albumProvider.notifier).getAlbums(context.read(userIdProvider).state);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, watch, child) {
          var albumList = watch(albumProvider).data!.value;
          return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context).accentColor,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            Text(
                              "Albums",
                              style: Theme.of(context)
                                  .textTheme
                                .headline1
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              style: Theme.of(context)
                                  .textTheme.headline3
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: albumList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.height / 50,
                            ),
                            child: AlbumWidget(
                              album: albumList[index],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 1,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ));
        }
    );
  }
}
