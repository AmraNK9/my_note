// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';

class Note {
  final int? id;
  final String title;
  final String content;
  late Color color;
  final bool isFav;
  final bool isDeleted;
  Note({
    this.id,
    required this.title,
    this.content = '',
    this.isFav = false,
    this.isDeleted = false,
  }) {
    print("create obj");
    color = _getRandomColor();
  }

  Color _getRandomColor() {
    
    List<Color> cCardColors = [
      Colors.pink.shade100,
      Colors.blue.shade100,
      Colors.yellow.shade100,
      Colors.green.shade100,
      Colors.purple.shade100
    ];

    return cCardColors[Random().nextInt(cCardColors.length)];
  }

  factory Note.fromDatabaseJson(Map<String, dynamic> data) => Note(
      id: data['id'],
      title: data['title'],
      content: data['content'],
      isDeleted: data['isDeleted'] == 0 ? false : true,
      isFav: data['isFav'] == 0 ? false : true);
  Map<String, dynamic> toDatabaseJson() => {
        'title': title,
        'content': content,
        'isDeleted': isDeleted == false ? 0 : 1,
        'isFav': isFav ? 1 : 0,
      };
}

// ignore: camel_case_types
