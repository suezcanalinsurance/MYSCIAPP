
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/AboutUsController.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/customeappbar.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';


class Terms extends StatelessWidget {
  AboutUsControllerImp controller = Get.put(AboutUsControllerImp());
  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp logincontroller = Get.put(LoginControllerImp());

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://www.sci-egypt.net/frontdesign/wp-content/uploads/2023/03/about-strateg-768x768.png';
    bool isLoggedIn = servicecontroller.isLogin();

    return Scaffold(
      appBar: MainAppBar(
        title: 'MY SCI',
        localcontroller: localcontroller,
      ),
      drawer: NavDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Header(
                  isLoggedIn: isLoggedIn,
                  mycontroller: mycontroller,
                  servicecontroller: myServices,
                ),
                customappbar(
                  titleapp: "findproducts".tr,
                  onPressedicon: () {},
                  onPressedsearch: () {
                    print("search");
                  },
                ),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Terms'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height / 30, left: _width / 20, right: _width / 20),
                      child: Text(
                        "termssub".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(height: _height / 30, color: Colors.white),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        mycontroller: mycontroller,
        servicecontroller: servicecontroller,
      ),
    );
  }

  Widget rowCell(String count, String type) => Expanded(
    child: Column(
      children: <Widget>[
        Text(
          '$count',
          style: TextStyle(color: Colors.blue),
        ),
        Text(
          type,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400,),
        ),
      ],
    ),
  );
}