import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ProducerController.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/data/model/ProducerModel.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';

class Producers extends StatelessWidget
{
  ProducerControllerTmp mycontroller=  Get.put(ProducerControllerTmp());

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: <Widget>[
        Container(
            alignment: AlignmentDirectional.center,
            width: double.infinity,


            child:  CustomTextFormAuth(
              isNumber: false,

              valid: (val) {

              },
              mycontroller: mycontroller.email,
              hinttext: " البحث بكود المنتج او اسم المنتج",
              iconData: Icons.search,
              labeltext: "بحث",onTapIcon: (){
              mycontroller.searchproducer();
            },

              // mycontroller: ,
            )),
    GetBuilder<ProducerControllerTmp>(
    builder: (controller) => HandlingDataView(
    statusRequest: controller.statusRequest,
    widget:  ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(5),
      itemCount:mycontroller.userLists.length,
      itemBuilder: (BuildContext context, int index) {
        return   prducerCard(producermodel : ProducerModel.fromJson(mycontroller.userLists[index]),);
      },
    )

    ))

      ],
    );
/*

    return Column(
      children: <Widget>[
        //Search Bar to List of typed Subject
        Container(
          padding: EdgeInsets.all(15),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              suffixIcon: InkWell(
                child: Icon(Icons.search),
              ),
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Search ',
            ),
            onChanged: (string) {


            },
          ),
        ),

    ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(5),
        itemCount: mycontroller.userLists.length,
        itemBuilder: (BuildContext context, int index) {
          return   CustomListProducer(producermodel : ProducerModel.fromJson(mycontroller.userLists[index]),);
        }
    )

      ],
    );
    */
  }


}

class prducerCard extends GetView<ProducerControllerTmp>
{
  final ProducerModel producermodel;
  const prducerCard({Key? key, required this.producermodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          child: Column(children: [
            Row( children: [Icon(Icons.account_circle_sharp,color:  Colors.green,) ,  Text(producermodel.producername!,style: TextStyle(fontSize: 14,color: Colors.green,fontWeight: FontWeight.bold),)]),
            SizedBox(height: 10,),
            Row( children: [Icon(Icons.padding_outlined,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text( producermodel.producercode!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
            SizedBox(height: 10,),
            Row( children: [Icon(Icons.location_on_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.BranchName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
              SizedBox(height: 10,),
            Row( children: [Icon(Icons.date_range_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.retiredate!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),

          ],),
          onTap: () {
            // if multi-select mode is true, tap should select List item
          },
          // Start List multi-select mode on long press
          onLongPress: () {


          },
        ),
      ),
    );
  }

}
class CustomListProducer extends GetView<ProducerControllerTmp> {
  final ProducerModel producermodel;
  const CustomListProducer({Key? key, required this.producermodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
    side: BorderSide(
    color: Colors.grey.shade300,
    ),
    ),
    child: Padding(
    padding: EdgeInsets.all(5.0),
    child: GestureDetector(
    child:
    Column(children: [
      Row( children: [Icon(Icons.safety_check,color:  Colors.green,) ,  Text("الوثيقة صحيحة",style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.bold),)]),
      SizedBox(height: 10,),
      Row( children: [Icon(Icons.padding_outlined,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text( producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
      SizedBox(height: 10,),
      Row( children: [Icon(Icons.sticky_note_2,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
      SizedBox(height: 10,),
      Row( children: [Icon(Icons.account_circle_sharp,color: AppColor.primaryColor),SizedBox(width: 4,),Text( producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
      SizedBox(height: 10,),
      Row( children: [Icon(Icons.date_range_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
      SizedBox(height: 10,),
      Row( children: [Icon(Icons.date_range_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
      SizedBox(height: 10,),
      Row( children: [Icon(Icons.monetization_on,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),

      SizedBox(height: 10,),
      Row( children: [Icon(Icons.ac_unit_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text(  producermodel.producername!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),

    ],)

    /*Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.circular(4.0)),

          ),
          title: Text(
            producermodel.producername!,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            producermodel.producercode! ?? "null",
            style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    )
    */

    )));
  }
}