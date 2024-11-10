import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/data/model/items_model.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomecontrollerTmp>  {
  final String type;
  const ListItemsHome({Key? key,required this.type }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List itemdata=[];
    if(type=="discount")
    {
      itemdata=controller.items_discount;
    }
    else
      {
        itemdata= controller.items;
      }

    return  SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return myItems(items:itemsmodel.fromJson(itemdata[i]));
          }),
    );
  }
}


class myItems extends StatelessWidget {
  final  itemsmodel  items;
  const myItems({Key? key,required this.items }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          padding:const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          margin:const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imagesItems}/${items.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10)),
          height: 120,
          width: 200,
        ), Positioned(
            left:10,
            child: Text("${translateDatabase(items.itemsName,items.itemsNameEn)}",style: TextStyle(color: Colors.white,fontSize: 17),))
      ],
    );
  }
}

