import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/components/pop_up_list_tile.dart';
import 'package:my_note/constant/color.dart';

class Post {
  final String id;
  final String imageUrl;
  final String title;
  final String contant =
      ": If you're a fan of Spiderman, this wall art is a must-have for your collection. It beautifully captures the essence of the iconic superhero, swinging through the city. Hang it up in your room and let Spiderman protect your walls!";

  Post(
    this.id,
    this.imageUrl,
    this.title,
  );
}

final List<Post> posts = [
  Post(
    'id0',
    'https://images.unsplash.com/photo-1568890686150-64af65720e69?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    'Spiderman wall art',
  ),
  Post(
    'id1',
    'https://images.unsplash.com/photo-1634828221818-503587f33d02?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1665&q=80',
    'Comic book collection',
  ),
  Post(
    'id2',
    'https://images.unsplash.com/photo-1596727147705-61a532a659bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    'Powerful Baby Groot',
  ),
  Post(
    'id3',
    'https://images.unsplash.com/photo-1611604548018-d56bbd85d681?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    'DC best friends',
  ),
  Post(
    'id4',
    'https://images.unsplash.com/photo-1624562563808-170065db4fcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
    'Spiderman in action',
  ),
  Post(
    'id5',
    'https://images.unsplash.com/photo-1534809027769-b00d750a6bac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    'Will he save Gwen?',
  ),
  Post(
    'id6',
    'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
    'Collector Edition',
  ),
  Post(
    'id7',
    'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    'Captain America strikes',
  ),
  Post(
    'id8',
    'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    'The Dark Knight',
  ),
  Post(
    'id9',
    'https://images.unsplash.com/photo-1608889175250-c3b0c1667d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGNvbWljJTIwc3VwZXJtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    'Snap snap',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset _tapPosition = Offset.zero;

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: posts.length,
      itemBuilder: (context, index) => GestureDetector(
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
                const PopupMenuItem(
                    value: 'favorites',
                    child:
                        popUpListTile(icon: Icons.favorite, text: "favorites")),
                const PopupMenuItem(
                    value: 'comment',
                    child: popUpListTile(icon: Icons.edit, text: "Edit")),
                const PopupMenuItem(
                    value: 'hide',
                    child: popUpListTile(
                      text: "Delete",
                      icon: Icons.delete,
                    )),
              ]);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: cCardColors[Random().nextInt(cCardColors.length)],
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Text(
              posts[index].title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              posts[index].contant,
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey[700]),
            )
          ]),
        ),
      ),
    );
  }
}
