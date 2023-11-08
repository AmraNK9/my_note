import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/constant/color.dart';


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

int selectedIndex = 1;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const FavPage(),
      const HomePage(),
      const RecyclePage()
    ];
    return MaterialApp(
      theme:ThemeData(backgroundColor: cBackGround),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      home: Scaffold(
    
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          actions: [IconButton(color: cPrimary, onPressed: (){}, icon: Icon(Icons.add))],
          backgroundColor: Colors.white,
          title: const Text(
            "My Notes",
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          index: 1,
          onTap: (index)=> setState(() {
            selectedIndex = index;
          }),
          items: const [
            Icon(FontAwesomeIcons.heart),
            Icon(FontAwesomeIcons.house),
            Icon(FontAwesomeIcons.trashCan)
          ],
        ),
        body: pageList[selectedIndex],
      ),
    );
  }
}
