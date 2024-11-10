import 'dart:ui';

import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/apptheme.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/model/branchmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class BranchController extends GetxController{

}
class BranchControllerTmp extends BranchController with GetSingleTickerProviderStateMixin
{


  late TabController controller;
  late StatusRequest statusRequest = StatusRequest.loading;
  late List<BranchModel> branchmodel_list;
  late List<BranchModel> branchmodel_list_main;
  late List<BranchModel> branchmodel_list_edary;

  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    print(langcode);

    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    update();
  }
  void onInit()
  {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    print(sharedPrefLang);
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    update();
   // initialData();

    super.onInit();
  }
  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }

  goToMap(String branchName,  String lat,String lnd){
    Get.toNamed(
      AppRoute.MapSample,
      arguments: {
        'branchName': branchName,
        'lat': lat,
        'lnd': lnd
      },
    );
  }
/*  initialData() {
    branchmodel_list = [
      BranchModel(

          BranchName: "BranchName1".tr,
          address: "address1".tr,
          email: "email1".tr,
          tel: "tel1".tr,

      ),
      BranchModel(
          BranchName: "BranchName2".tr,
          address: "address2".tr,
          email: "email2".tr,
          tel: "tel2".tr
      ),
      BranchModel(
          BranchName: "BranchName3".tr,
          address: "address3".tr,
          email: "email3".tr,
          tel: "tel3".tr
      ),
      BranchModel(
          BranchName: "BranchName4".tr,
          address: "address4".tr,
          email: "email4".tr,
          tel: "tel4".tr
      ),
      BranchModel(
          BranchName: "BranchName5".tr,
          address: "address5".tr,
          email: "email5".tr,
          tel: "tel5".tr
      ),
      BranchModel(
          BranchName: "BranchName6".tr,
          address: "address6".tr,
          email: "email6".tr,
          tel: "tel6".tr
      ),
      BranchModel(
          BranchName: "BranchName7".tr,
          address: "address7".tr,
          email: "email7".tr,
          tel: "tel7".tr
      ),
      BranchModel(
          BranchName: "BranchName8".tr,
          address: "address8".tr,
          email: "email8".tr,
          tel: "tel8".tr
      ),
      BranchModel(
          BranchName: "BranchName9".tr,
          address: "address9".tr,
          email: "email9".tr,
          tel: "tel9".tr
      ),
      BranchModel(
          BranchName: "BranchName10".tr,
          address: "address10".tr,
          email: "email10".tr,
          tel: "tel10".tr
      ),
      BranchModel(
          BranchName: "BranchName11".tr,
          address: "address11".tr,
          email: "email11".tr,
          tel: "tel11".tr
      )
    ];



    branchmodel_list_main = [
      BranchModel(
          BranchName: "BranchName1".tr,
          address: "address1".tr,
          email: "email1".tr,
          tel: "tel1".tr
      ),

    ];


    branchmodel_list_edary = [
      BranchModel(
          BranchName: "BranchName2".tr,
          address: "address2".tr,
          email: "email2".tr,
          tel: "tel2".tr
      ),
      BranchModel(
          BranchName: "edary1name".tr,
          address: "edary1address".tr,
          email: "" ,
          tel: "edary1tel".tr
      ),
      BranchModel(
          BranchName: "edary2name".tr,
          address: "edary2address".tr,
          email: "",
          tel: "edary2tel".tr
      ),
      BranchModel(
          BranchName: "edary3name".tr,
          address: "edary3address".tr,
          email: "",
          tel: "edary3tel".tr
      ),
      BranchModel(
          BranchName: "edary4name".tr,
          address: "edary4address".tr,
          email: "",
          tel: "edary4tel".tr
      ),
      BranchModel(
          BranchName: "edary5name".tr,
          address: "edary5address".tr,
          email: "",
          tel: "edary5tel".tr
      ),
      BranchModel(
          BranchName: "edary6name".tr,
          address: "edary6address".tr,
          email: " ",
          tel: "edary6tel".tr
      ),



    ];
    statusRequest = StatusRequest.success;
    update();
  }*/
}
