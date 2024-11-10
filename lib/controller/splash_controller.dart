import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/datasource/static/static.dart';

abstract class SplashController extends GetxController {

}

class SplashControllerImp extends SplashController {




  MyServices myServices = Get.find() ;

  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  isLogin()
  {
    if (myServices.sharedPreferences.getBool("islog")==true) {
      return true;
    }
    else
    {
      return false;
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
