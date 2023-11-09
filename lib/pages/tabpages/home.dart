import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_note/business_logic/bloc/task_bloc.dart';
import 'package:my_note/components/dialog.dart';
import 'package:my_note/components/pop_up_list_tile.dart';
import 'package:my_note/constant/color.dart';
import 'package:my_note/constant/route.dart';
import 'package:my_note/models/Notes.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TaskBloc taskBloc;
  Offset _tapPosition = Offset.zero;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
     taskBloc = context.read<TaskBloc>();

    
    taskBloc.add(Fetch());
  }
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }
 
  @override
  Widget build(BuildContext context) {
  

    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (kDebugMode) {
          print(" state : ${state.noteList}");
        }
        List<Note> noteList = state.noteList.where((element) => element.isDeleted == false).toList();
        return MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: noteList.length,
          itemBuilder: (context, index) { 
            Note note = noteList[index];
          
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(rDetailPage,arguments: note),
            onTapDown: _getTapPosition,
            onLongPress: () {
              showMenu(

                  color: cPrimary,
                  context: context,
                  position: RelativeRect.fromRect(
                      Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
                      Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                          overlay.paintBounds.size.height)),
                  items: [
                     PopupMenuItem(
                      onTap: () => print("favorites ${note.id}"),
                        value: 'favorites',
                        child: const popUpListTile(
                            icon: Icons.favorite, text: "favorites")),
                     PopupMenuItem(
                        value: 'Edit',
                        onTap: () {},
                        child: const popUpListTile(icon: Icons.edit, text: "Edit")),
                      PopupMenuItem(
                        onTap: (){
                          showDialog(context: context, builder: (context) => cDialog(text: "Are You Sure to Deleted", onOk: (){
                            taskBloc.add(Delete(id: note.id!));
                            taskBloc.add(Fetch());
                          }));
                        },
                        value: 'hide',
                        child: const popUpListTile(
                          text: "Delete",
                          icon: Icons.delete,
                        )),
                  ]);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: note.color,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Text(
                  note.title + note.id.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  note.content,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey[700]),
                )
              ]),
            ),
          );}
        );
      },
    );
  }
}
