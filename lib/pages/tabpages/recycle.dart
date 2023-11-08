import 'package:flutter/material.dart';
import 'package:my_note/constant/color.dart';

class RecyclePage extends StatefulWidget {
  const RecyclePage({super.key});

  @override
  State<RecyclePage> createState() => _RecyclePageState();
}

class _RecyclePageState extends State<RecyclePage> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: cBackGround,
      body: Center(child: Text("Recycle"),),
    );
  }
  
}