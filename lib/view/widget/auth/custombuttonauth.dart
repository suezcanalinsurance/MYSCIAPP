import 'package:suezproduction/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final Color color;

  final void Function()? onPressed;

  const CustomButtomAuth({Key? key, required this.text, this.onPressed, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color:color ,
        textColor: Colors.white,
        child:
            Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16))

        ,
      ),
    );
  }
}


class CustomButtomWithIcon extends StatelessWidget {
  final String text;
  final Color color;
  final Widget myicon;
  final void Function()? onPressed;

  const CustomButtomWithIcon({Key? key, required this.text, this.onPressed, required this.color,required this.myicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color:color ,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
            myicon
          ],
        ),
      ),
    );
  }
}
