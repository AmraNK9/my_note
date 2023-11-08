import 'package:flutter/material.dart';
import 'package:my_note/constant/color.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: cBackGround,
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              cursorHeight: 30,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            TextField(maxLines: 10, style:  TextStyle(fontSize: 20),decoration: InputDecoration(border: InputBorder.none),)
          ],
        ),
      )),
    );
  }
}
