import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/data/model/categories_model.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListCategoriesHome extends GetView<HomecontrollerTmp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return GetBuilder<HomecontrollerTmp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return viewdemo(
              index: index,
              doctor: controller.categories[index],
            );
          },
        ),
      ),
    );
  }
}

class viewdemo extends   GetView<HomecontrollerTmp>{
  viewdemo({ Key? key, required this.index, required this.doctor}) : super(key: key);
final int index;
final doctor;


  @override
  Widget build(BuildContext context) {
  return   InkWell(
      onTap: (){
        //  controller.gotoitems(controller.categories,index!, doctor["categories_id"],doctor["categories_name"],doctor["email"]);
        controller.producerurl(doctor["categories_name"],doctor["categories_name_en"],doctor["url"],doctor["enurl"],doctor["email"]);

        // print(doctor["categories_name_en"]);
      },
      child: Column(children: [
      Container(
      width: 350,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
     /*     border: Border.all( // إضافة الحد الأزرق
            color: Colors.blue, // لون الحد
            width: 0, // عرض الحد
          )*/

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "${AppLink.imagesCategories}/${doctor["categories_image"]}", // Replace with your image URL
              fit: BoxFit.cover,
              width: 300,
              height: 200,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "${translateDatabase(doctor["categories_name"], doctor["categories_name_en"])}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),

        ],
      ),
    ),SizedBox(height: 10,)
    ],));
  }
  }


class DoctorBox extends   GetView<HomecontrollerTmp>{
  DoctorBox({ Key? key, required this.index, required this.doctor}) : super(key: key);
  final int index;
  final doctor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      //  controller.gotoitems(controller.categories,index!, doctor["categories_id"],doctor["categories_name"],doctor["email"]);
      controller.producerurl(doctor["categories_name"],doctor["categories_name_en"],doctor["url"],doctor["enurl"],doctor["email"]);

       // print(doctor["categories_name_en"]);
      },
      child:Container(
        margin: const EdgeInsets.only(right: 5, bottom: 0, top: 10, left: 5),
        width: 60,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.transparent, // إزالة اللون الأبيض من الخلفية
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all( // إضافة الحد الأزرق
            color: Colors.blue, // لون الحد
            width: 2, // عرض الحد
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${AppLink.imagesCategories}/${doctor["categories_image"]}"),
                    fit: BoxFit.cover, // يمكنك ضبط هذا ليتناسب مع التصميم الخاص بك
                  ),
                  borderRadius: BorderRadius.circular(15), // إضافة هذا إذا كنت ترغب في أن يتبع الحد الخارجي
                ),
              ),
              SizedBox(height: 5), // إضافة مساحة بين الصورة والنص
              Text(
                "${translateDatabase(doctor["categories_name"], doctor["categories_name_en"])}",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.SCIsecondaryColor,
                ),
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}


/*class Categories extends GetView<HomecontrollerTmp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories( {Key? key, required this.categoriesModel,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.gotoitems(controller.categories,i!, categoriesModel.categoriesId!);
      },

      child: Column(

        children: [
          Container(
              decoration: BoxDecoration(


                  borderRadius:
                  BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              height: 60,
              width: 80,
              child: Image.network(
                "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}",
              )),
          Text(
            "${translateDatabase(categoriesModel.categoriesName,categoriesModel.categoriesNameEn)}",
            style: TextStyle(
                fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}*/


