import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/constant/color.dart';
import 'package:my_note/constant/route.dart';
import 'package:my_note/pages/tabpages/fav.dart';
import 'package:my_note/pages/tabpages/home.dart';
import 'package:my_note/pages/tabpages/recycle.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 List<Widget> pageList = [
      const FavPage(),
      const HomePage(),
      const RecyclePage()
    ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: cBackGround,
        appBar: AppBar(
          actions: [IconButton(color: cPrimary, onPressed: (){
            Navigator.pushNamed(context, rAddPage);
          }, icon: const Icon(Icons.add))],
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
      );
  }
}