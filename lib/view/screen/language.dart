import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/widget/auth/logoauth.dart';
import 'package:suezproduction/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class Language extends GetView<LocaleController> {

  MyServices myServices = Get.find() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Container(
                     decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                )),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const NewLogoAuth(),
              SizedBox(height: 50,),
              Row(
                children: [

                  Text("       Choose Language  ", style: Theme.of(context).textTheme.headline1),
                  Text("       إختر اللغة  ", style: Theme.of(context).textTheme.headline1),
                ],
              ),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    myServices.sharedPreferences.setString("step", "2") ;
                    Get.toNamed(AppRoute.login) ;
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    myServices.sharedPreferences.setString("step", "2") ;
                    Get.toNamed(AppRoute.login) ;
                  }),


             ],
          )),
    );
  }
}
