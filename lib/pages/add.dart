import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/business_logic/bloc/task_bloc.dart';
import 'package:my_note/constant/color.dart';
import 'package:my_note/models/Notes.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskBloc taskBloc = context.read<TaskBloc>();
    TextEditingController title = TextEditingController();
     TextEditingController content = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {taskBloc.add(Add(note: Note(title: title.text,content: content.text)));},
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
        padding: const EdgeInsets.all(16),
        child: ListView(
          children:  [
            TextField(
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              cursorHeight: 30,
              controller: title,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                
              ),
            ),
            TextField(
              controller: content,
              maxLines: 60,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintText: "Someting...", border: InputBorder.none),
            )
          ],
        ),
      )),
    );
  }
}
