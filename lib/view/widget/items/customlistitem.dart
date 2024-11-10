import 'package:cached_network_image/cached_network_image.dart';
import 'package:suezproduction/controller/Itemscontroller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/data/model/items_model.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:suezproduction/view/widget/progressbar.dart';

class CustomListItem extends GetView<ItemcontrollerTmp> {

  final  itemsmodel item_model;
  const CustomListItem({Key? key, required this.item_model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return    Column(
      children: [
        SizedBox(
          height: 10,
        ),
        //




        Expanded(
            child: ListView.builder(
              itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(

                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(children: [
                        ProgramsBar(title: "${translateDatabase(item_model.itemsName!,item_model.itemsNameEn! )}",),Html(
                        data: translateDatabase(item_model.itemsDesc!,item_model.itemsDescEn!),)],) );
                }))
      ],
    );

return Expanded( child: Column(children: [
    CachedNetworkImage(imageUrl:AppLink.imagestatic+"Items/"+ item_model.itemsImage!,
      height: 200,
      fit: BoxFit.fill,),
    Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        /*  child:     Text(translateDatabase(item_model.itemsDesc!,item_model.itemsDescEn!),style: TextStyle(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.bold),  maxLines: 3,
    overflow:TextOverflow.clip,*/
        child: Expanded(child:  Html(
          data: translateDatabase(item_model.itemsDesc!,item_model.itemsDescEn!),)),


      ),
    )


  ]) ,);

      /*  return InkWell(
          child: Card(
            child:Padding(
              padding:EdgeInsets.all(10),
              child: Column(

                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(imageUrl:AppLink.imagestatic+"Items/"+ item_model.itemsImage!,
                    height: 100,
                    fit: BoxFit.fill,),
                  SizedBox(height: 10) ,
InkWell(onTap: (){

controller.productDetail(item_model.itemsId!);

},child:                   Text(translateDatabase(item_model.itemsName!,item_model.itemsNameEn!),style: TextStyle(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.bold),),
    ),                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                    (index) => Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${item_model.itemsPrice} \$",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );*/

  }
}
