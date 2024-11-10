import 'package:suezproduction/controller/Itemscontroller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/data/model/categories_model.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemcontrollerTmp> {




  @override
  Widget build(BuildContext context) {

    return  SizedBox(
        height: 50,
          child: ListView.separated(
            shrinkWrap: true,
              controller: controller.scrollController,

            separatorBuilder: (context, index) => SizedBox(
              width: 30,
            ),
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Categories(i:index, categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);

            }));
  }
}

class Categories extends GetView<ItemcontrollerTmp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories( {Key? key, required this.categoriesModel,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
controller.changeCat(i,categoriesModel.categoriesId!);


      },

      child: Column(
        children: [
SizedBox(height: 10,),
       GetBuilder<ItemcontrollerTmp>(builder: (controller)=> Container(
         padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
         decoration:controller.selectedCat==i? BoxDecoration(

             border:  Border(bottom: BorderSide(width: 3,color: AppColor.primaryColor))
         ):null,
         child:   Text(
           "${translateDatabase(categoriesModel.categoriesName,categoriesModel.categoriesNameEn)}",
           style: TextStyle(
               fontSize: 16, color: AppColor.secoundColor),
         ),))
        ],
      ),
    );
  }
}

