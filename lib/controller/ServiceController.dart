import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';

class ServiceController   extends GetxController with GetSingleTickerProviderStateMixin {
  MyServices myServices=Get.find();
  late AnimationController animationController;
  late Animation<double> myanimation;
  late Animation<double> myanimation2;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds:5,
      ),
    );

    myanimation=Tween<double>(begin: 0,end: 50).animate(animationController);
    myanimation2=Tween<double>(begin: 0,end: 15).animate(animationController);
    if (animationController.status==AnimationStatus.completed) {
      animationController.reverse();

    }
    else
    {
      animationController.forward();
    }
    update();
  }


  @override
  goToBranches() {
    Get.offNamed(AppRoute.Branches);
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

}