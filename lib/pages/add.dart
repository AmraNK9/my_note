import 'package:flutter/material.dart';
import 'package:my_note/constant/color.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackGround,
      body: Center(child: Text("Add Cart"),),
    );
  }
}