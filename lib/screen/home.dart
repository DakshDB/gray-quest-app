import 'package:flutter/material.dart';
import 'package:gray_quest/controller/profile_controller.dart';
import 'package:gray_quest/model/bottom_navigation.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/model/user_model.dart';
import 'package:gray_quest/screen/album.dart';
import 'package:gray_quest/screen/posts.dart';
import 'package:gray_quest/screen/profile.dart';
import 'package:gray_quest/screen/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  PageController? _pageController;

  static const snackBarDuration = Duration(seconds: 3);

  final snackBar = SnackBar(
    content: Text('Press back again to leave'),
    duration: snackBarDuration,
  );

  DateTime? backButtonPressTime;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    if(_pageController!=null)
      _pageController!.dispose();
    super.dispose();
  }

  List<Widget> _widgetOptions = <Widget>[
    PostScreen(),
    AlbumScreen(),
    TodoScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => handleWillPop(context),
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: _widgetOptions
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).accentColor,
          selectedItemColor: Theme.of(context).textTheme.headline1!.color,
          unselectedItemColor: Theme.of(context).secondaryHeaderColor,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
              icon: destination.icon, label: destination.title,);
          }).toList(),
          onTap: _onItemTapped
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController!.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeInToLinear);
    });
  }
  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }

    return true;
  }
}

