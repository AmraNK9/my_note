import 'dart:math';

import 'package:flutter/material.dart';

class Note {
  final String title;
  final String content;
  late Color? color;
  final bool isFav;
  final bool isDelete;
  final DateTime? archiveDate;
  Note({
    required this.title,
    this.content = '',
    this.isFav = false,
    this.isDelete = false,
    this.archiveDate,
  }) {
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
}

// ignore: camel_case_types
