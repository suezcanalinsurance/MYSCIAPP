import 'package:suezproduction/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
      style: const TextStyle(
          color:Colors.indigoAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),);
  }
}
