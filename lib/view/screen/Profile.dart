import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ProducerController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/auth/signup_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/core/functions/validinput.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/model/ProducerModel.dart';
import 'package:suezproduction/view/screen/Home.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/home/display_image_widget.dart';

class Profile extends StatelessWidget
{
  ProducerControllerTmp mycontroller=  Get.put(ProducerControllerTmp());
  MyServices myServices=Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return  Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'profile'.tr,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ))),
          InkWell(
              onTap: () {

              },
              child: DisplayImage(
                imagePath: 'https://sci-broker.com/azab/pesonal.png',
                onPressed: () {},
              )),
          buildUserInfoDisplay( myServices.sharedPreferences.getString("username").toString(), "20".tr),
          buildUserInfoDisplay(myServices.sharedPreferences.getString("phone").toString(), "21".tr),
          buildUserInfoDisplay(myServices.sharedPreferences.getString("email").toString(), "18".tr),
          SizedBox(height: 60,),
          InkWell(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.blue,
                ),
                title:Text(
                  'back'.tr,
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.blue.shade900),
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()));
              //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
            },
          )
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {

                            },
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  }

