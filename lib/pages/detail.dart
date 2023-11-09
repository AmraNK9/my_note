import 'package:flutter/material.dart';
import 'package:my_note/constant/color.dart';

class DetailPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  note;
  const DetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackGround,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: [
            const SizedBox(height: 16,),
            Text(
              note.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16,),
            Text(
              note.content,
              style: const TextStyle(fontSize: 16),
              )
          ])),
    );
  }
}
