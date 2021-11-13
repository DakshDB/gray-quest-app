import 'package:flutter/material.dart';
import 'package:gray_quest/theme.dart';

class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final icon;
}

List<Destination> allDestinations = <Destination>[
  Destination('Home', Image.asset("assets/logo.png", width: 23, height: 23, color: AppTheme.secondaryHeaderColor,)),
  Destination('Albums', Icon(Icons.favorite_border_outlined)),
  Destination('To Do List', Icon(Icons.chat_bubble_outline_outlined)),
  Destination('Profile', Icon(Icons.account_circle_outlined))
];