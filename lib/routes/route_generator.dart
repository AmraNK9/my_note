
import 'package:flutter/material.dart';
import 'package:my_note/constant/route.dart';
import 'package:my_note/pages/add.dart';
import 'package:my_note/pages/detail.dart';
import 'package:my_note/pages/edit.dart';
import 'package:my_note/pages/tabpages/fav.dart';

import 'package:my_note/pages/tabpages/home.dart';
import 'package:my_note/pages/tabpages/recycle.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arg = settings.arguments;
    switch(settings.name){
      case rHomePage:
        return MaterialPageRoute(builder: (context) => HomePage(),);
      case rDetailPage:
        return MaterialPageRoute(builder: (context) => DetailPage(note: arg,));
      case rAddPage:
        return MaterialPageRoute(builder: (context) => AddPage());
      case rEdtiPage:
        return MaterialPageRoute(builder: (context) => EditPage());
      case rRecyclePage:
        return MaterialPageRoute(builder: (context) => RecyclePage());
      case rFavPage:
        return MaterialPageRoute(builder: (context) => FavPage(),);
      default :
        return MaterialPageRoute(builder: (context) => HomePage(),);
    }
  }
}