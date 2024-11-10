import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find() ; 

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("step") == "2"){
      return const RouteSettings(name: AppRoute.login) ;
    }
     if(myServices.sharedPreferences.getString("step") == "1"){
      return const RouteSettings(name: AppRoute.Language) ;
     }
    if(myServices.sharedPreferences.getString("step") == "3"){
      return const RouteSettings(name: AppRoute.home) ;
    }
  }
}
