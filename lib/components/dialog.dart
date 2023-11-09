import 'package:flutter/material.dart';

class cDialog extends StatelessWidget {
  final Function onOk;
  final String text;
   cDialog({super.key,required this.text,required this.onOk});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(text),
      actions: [
      TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancel")),
      TextButton(onPressed: (){
        onOk();
        Navigator.of(context).pop();}, child: Text("Ok"))
        
      ],
    );
  }
}