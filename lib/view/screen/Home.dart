

import 'package:flutter/services.dart';

import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';

import 'package:suezproduction/core/constant/routes.dart';

import 'package:suezproduction/core/services/services.dart';

import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/Profile.dart';

import 'package:suezproduction/view/widget/customeappbar.dart';

import 'package:suezproduction/view/widget/home/NavDrawer.dart';

import 'package:suezproduction/view/widget/home/Services2.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


/*

class HomePage extends StatelessWidget {

    HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MyServices myServices=Get.find();
    HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
    ServiceController servicecontroller = Get.put(ServiceController());
    return GetBuilder<HomecontrollerTmp>(builder: (controller) {
// print(AppLink.imagesItems+"/"+controller.items[0]["items_image"]);
      return Scaffold(
        drawer: NavDrawer(),
        appBar: appBottomView(
          gotoroot: AppRoute.home,
          myargument: {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FlutterPhoneDirectCaller.callNumber('16569');
          },
          child: Icon(Icons.phone, color: AppColor.primaryColor)
/*
              Image.network(
                "${AppLink.imagestatic}/whatsicons.png",
              )*/
          ,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.home),
                        Text("home".tr,
                            style:  Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.view_compact),
                        Text("about".tr,
                            style:  Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      servicecontroller.isLogin()== true
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()))
                          : mycontroller.goToSignIn();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.perm_contact_calendar_rounded),
                        Text("profile".tr,
                            style:  Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  servicecontroller.isLogin()== true
                      ? MaterialButton(
                          onPressed: () {
                            mycontroller.sharedrefrense_clear();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.output_sharp),
                              Text("exit".tr,
                                  style:   Theme.of(context).textTheme.bodyText1)
                            ],
                          ),
                        )
                      : MaterialButton(
                          onPressed: () {
                            mycontroller.goToSignIn();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.account_circle_sharp),
                              Text("login".tr,

                                  style:  Theme.of(context).textTheme.bodyText1)
                            ],
                          ),
                        )
                ],
              )
            ],
          ),
        ),
          body: SingleChildScrollView(
              child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
                child: Column(children: <Widget>[
                /*  if(controller.StoredPassword == null && myServices.sharedPreferences.getBool("islog")==true )
                    TouchIDButton()
                  else
                      Row() ,*/
                  servicecontroller.isLogin()==true ?
                  Container( child: Text("hello".tr+mycontroller.name.toString(),style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.primaryColor,fontSize: 14),)):
                  Row(),
              customappbar(
                titleapp: "findproducts".tr,
                onPressedicon: () {},
                onPressedsearch: () {
                  print("search");
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Services2(),
                  const SizedBox(
                    height: 5,
                  ),

          /*       ProgramsBar2(
                    title: "priceshow".tr,
                  ) // <- this your widget!


                  ,
                  EventsAndExperiences(),
                    ProgramsBar(
                        title: "cat".tr,
                      ) // <- this your widget!


,
              const SizedBox(
                height: 5,
              ),

              ListCategoriesHome(),
              const SizedBox(
                height: 10,
              )*/
            ]))
          )
        ));});

  }

}
*/