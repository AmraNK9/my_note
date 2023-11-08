import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/constant/color.dart';
import 'package:my_note/constant/route.dart';
import 'package:my_note/pages/main_page.dart';


import 'package:my_note/pages/tabpages/fav.dart';
import 'package:my_note/pages/tabpages/home.dart';
import 'package:my_note/pages/tabpages/recycle.dart';
import 'package:my_note/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      theme:ThemeData(backgroundColor: cBackGround),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      home: MainPage()
    );
  }
}
