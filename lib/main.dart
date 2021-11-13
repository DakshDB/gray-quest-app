import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/screen/login.dart';
import 'package:gray_quest/theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, watch) {
    return MaterialApp(
      title: 'GrayQuest App',
      debugShowCheckedModeBanner: false,
        home: LoginScreen(),
    theme: ThemeData(
          scaffoldBackgroundColor: AppTheme.backgroundColor,
          primaryColor: AppTheme.primaryColor,
        accentColor: AppTheme.accentColor,
        backgroundColor: AppTheme.backgroundColor,
        cardColor: AppTheme.cardColor,
        secondaryHeaderColor: AppTheme.secondaryHeaderColor,
        textTheme: TextTheme(
          headline1: TextStyle(color: AppTheme.textColor, fontSize: 30, fontWeight: FontWeight.normal ),
          headline2: TextStyle(color: AppTheme.textColor, fontSize: 22),
          headline3: TextStyle(color: AppTheme.textColor, fontSize: 16 ),
          headline4: TextStyle(color: AppTheme.secondaryHeaderColor, fontSize: 16 ),
          caption: TextStyle(color: AppTheme.textColor, fontSize: 18 , fontWeight: FontWeight.w300),
          button: TextStyle(color: AppTheme.textColor, fontSize: 20 , fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: AppTheme.textColor, fontSize: 16),
          bodyText2: TextStyle(color: AppTheme.secondaryHeaderColor, fontSize: 16),
        )
      ),


    );
  }
}
