import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:mailto/mailto.dart';

import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:url_launcher/url_launcher.dart';


class contactus extends StatelessWidget {
  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp  logincontroller= Get.put(LoginControllerImp());


  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();
    return  Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20), // Space at the top
                Header(
                  isLoggedIn: isLoggedIn,
                  mycontroller: mycontroller,
                  servicecontroller: myServices,
                ),

                InkWell(
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        title: Text(
                          '16569',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 18,
                              color: Colors.blue.shade900),
                        ),
                      ),

                    ),
                    onTap: (){
                      //  _launchURL('tel:16569');
                      FlutterPhoneDirectCaller.callNumber('16596');


                    }
                ),
                InkWell(
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      title:Text(
                        ' info@sci-egypt.com',
                        style: TextStyle(

                            fontSize: 18,
                            color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  onTap:_sendEmail,

                ),
              /*  InkWell(
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "address1".tr,
                          style: TextStyle(

                              fontSize: 18,
                              color: Colors.blue.shade900),
                        ),
                      ),

                    ),
                    onTap: (){
                      //  _launchURL('tel:16569');
                    }
                ),*/
                InkWell(
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.blue,
                      ),
                      title:Text(
                        "back".tr,
                        style: TextStyle(
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
                ),

                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          mycontroller: mycontroller,
          servicecontroller: servicecontroller,
        )

    );
  }
  void _sendEmail() async {
    final mailtoLink = Mailto(
      to: ['info@sci-egypt.com'],

      subject: '',
      body: '',
    );

    // Convert the mailtoLink to a Uri and then launch it
    await launch('$mailtoLink');
  }
}






