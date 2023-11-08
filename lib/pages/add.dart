import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/constant/color.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: cPrimary,
        child: const Icon(FontAwesomeIcons.floppyDisk),
      ),
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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: const [
            TextField(
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            TextField(
              maxLines: 60,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: "Someting...", border: InputBorder.none),
            )
          ],
        ),
      )),
    );
  }
}
