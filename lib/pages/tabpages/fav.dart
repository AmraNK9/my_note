import 'package:flutter/material.dart';
import 'package:my_note/constant/color.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: cBackGround,
      body: Center(child: Text("Fav"),),
    );
  
  }
}