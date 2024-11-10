import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final String gotoroot;
  final Map<String, dynamic> myargument;
  Size get preferredSize => const Size.fromHeight(50);
  MyAppBar({Key? key, required this.gotoroot, required this.myargument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController localcontroller=  Get.put(LocaleController());
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      leading: InkWell(onTap: (){
        Get.toNamed(AppRoute.home) ;
      },child: Image.asset(AppImageAsset.logo2,width: 50,height: 50,),) , // you can put Icon as well, it accepts any widget.
      title: InkWell(onTap: (){
    Get.toNamed(AppRoute.home) ;
    },child:Text ("title".tr,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
      actions: [
        Row(children: [
          MaterialButton(onPressed: (){

            localcontroller.goToSignUp();
          },child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImageAsset.sign,width: 30,height: 30,),Text("تسجيل الدخول",  style: TextStyle( fontFamily: 'Heavy',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
            ],),)
        ],),
        Row(children: [
          MaterialButton(onPressed: (){

            localcontroller.goToSignIn();
          },child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImageAsset.signup,width: 30,height: 30,),Text("مستخدم جديد",  style: TextStyle( fontFamily: 'Heavy',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
            ],),)
        ],),
      ],
    );
  }
}
