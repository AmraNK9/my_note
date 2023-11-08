import 'package:flutter/material.dart';

class popUpListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const popUpListTile({super.key, required this.icon ,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          size: 20,
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
         Text(text, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
