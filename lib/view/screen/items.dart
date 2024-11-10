import 'package:flutter_html/flutter_html.dart';
import 'package:suezproduction/controller/Itemscontroller.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/model/items_model.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/customeappbar.dart';
import 'package:suezproduction/view/widget/customescaffoldAppbar.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';
import 'package:suezproduction/view/widget/items/customlistitem.dart';
import 'package:suezproduction/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Items extends StatelessWidget {

  ItemcontrollerTmp controller = Get.put(ItemcontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    List categories = [];

    MyServices myServices = Get.find();
    HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
    ServiceController servicecontroller = Get.put(ServiceController());
    LocaleController localcontroller = Get.put(LocaleController());
    LoginControllerImp  logincontroller= Get.put(LoginControllerImp());


      bool isLoggedIn = servicecontroller.isLogin();
      return  Scaffold(
       /*  floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Action to be taken when the button is pressed
              if (  servicecontroller.isLogin()== true) {
                _showPopup(context);
              }
              else {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('يجب عليك التسجيل أولا'),
                    backgroundColor: Colors.red,
                  ),
                );
              }


            },
            icon: Icon(Icons.email),
            label: Text(" ارسل رسالة",style: TextStyle(color: Colors.white,fontSize:12)),
            backgroundColor: Colors.blue, // Background color of the button
          )*/
          appBar: MainAppBar(
            title: 'MY SCI',
            localcontroller: localcontroller,
          ),
          drawer: NavDrawer(),
          body:
             SafeArea(
              child: ListView(
                  children: [

                    //    ListCategoriesItems(),

                    GetBuilder<ItemcontrollerTmp>(
                        builder: (controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget:
                            GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.data.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:1, childAspectRatio: 0.7),
                                itemBuilder: (BuildContext context, int index) {
                                  return   CustomListItem(item_model: itemsmodel.fromJson(controller.data[index]),);
                                }) ))
                  ]),
            ),

          bottomNavigationBar: CustomBottomAppBar(
            mycontroller: mycontroller,
            servicecontroller: servicecontroller,
          )

      );
    }


  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('إرسال رسالة لإدارة'+ controller.categoryname.toString() ),
          content: Form(
            key: controller.formKeyitem,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(controller.email!,style: TextStyle(color: Colors.blue,fontSize: 14),),
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'الإسم',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الإسم';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.subjectController,
                  decoration: InputDecoration(
                    labelText: 'موضوع الرسالة',
                  ),
                  maxLines: 5, // Allows the text field to expand as a textarea
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الرسالة';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.formKeyitem.currentState!.validate()) {
                  controller.sendEmail();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('تم إرسال الرسالة بنجاح'),
                      backgroundColor: Colors.green,
                    ),
                  );

                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set the button color to blue
              ),
              child: Text('إرسل',style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}