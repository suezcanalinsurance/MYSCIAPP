import 'package:suezproduction/controller/Branches_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:suezproduction/view/widget/customeappbar.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';



class Branches extends StatelessWidget {

  BranchControllerTmp controller= Get.put(BranchControllerTmp());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: NavDrawer(),

        appBar:    appBottomView(gotoroot: AppRoute.home,myargument: {},),

        body: SingleChildScrollView(

            child:GetBuilder<BranchControllerTmp>(builder: (controller) {

              return  HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon( Icons.account_balance,),
                        title:   Text(
                          'فـــروع الشركــة',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.blue.shade900),
                        )

                      )
                    ,

                      ListView.separated(
                        primary: false,

                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 25,
                        ),
                        itemCount: controller.branchmodel_list.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(20)),

                                    height: 210,
                                    width: 350,
                                    child:Column(children: [
                                      Text(controller.branchmodel_list[index].BranchName!,style: TextStyle(fontSize: 18,color: AppColor.kBlueColor,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(controller.branchmodel_list[index].address!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                                      SizedBox(height: 10,),
                                      Row( children: [Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list[index].tel!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                                      SizedBox(height: 10,),
                                      Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list[index].email!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                                    ],)),
                                SizedBox(height: 5,)
                              ],
                            ) ,
                      )

                    ])
              );}) )  );
  }
}
