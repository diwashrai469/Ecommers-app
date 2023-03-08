import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String? text;

  final double? size;
  const CustomeText({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        style: TextStyle(fontSize: size, fontWeight: FontWeight.bold));
  }
}
