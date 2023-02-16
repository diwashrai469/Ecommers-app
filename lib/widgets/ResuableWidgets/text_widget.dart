import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? text;

  double? size;
  TextWidget({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: TextStyle(fontSize: size, fontWeight: FontWeight.bold));
  }
}
