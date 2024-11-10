import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  final void Function()  onPressedsearch;
  const CustomCardHome({Key? key, required this.title, required this.body, required this.onPressedsearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              alignment: Alignment.center,
              child: ListTile(
                title: Text(title,
                  textAlign: TextAlign.right,
                  style:const TextStyle(

                      color: Colors.white, fontSize: 18),
                ),
                subtitle: InkWell(child: Container(child: Text(body,
                    textAlign: TextAlign.right,

                    style:const TextStyle(

                        color: Colors.white, fontSize: 14)),padding: EdgeInsets.only(right: 16.0, top: 8.0),),onTap:onPressedsearch,),
              ),
            ),
          ),

          Positioned(
              top: -20,
              left: -60,
              child: Container(

                height: 160,
                width: 160,
                decoration: BoxDecoration(

                    image: const DecorationImage(
                      image: NetworkImage(
                          '${AppLink.imagestatic}/tel.png'),
                      fit: BoxFit.cover,
                    ),
                    color: AppColor.secoundColor,
                    borderRadius: BorderRadius.circular(160)),
              ))
        ],
      ),
    );
  }
}
