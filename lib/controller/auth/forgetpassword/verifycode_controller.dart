import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/auth/forgetpassword/verifycodeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verivycodeData=new VerifyCodeData(Get.find());
  StatusRequest statusrequest=StatusRequest.none;
  String? email;
  @override
  checkCode() {}
  @override
  goToResetPassword(String verifycode) async {
    statusrequest=StatusRequest.loading;
    update();

   var response=await verivycodeData.postdata(email!, verifycode);
   // print(email!);
   // print(verifycode);
    print(response);
    statusrequest=handlingData(response);
    if (statusrequest==StatusRequest.success) {
      if (response['status'] == "success") {

       Get.offNamed(AppRoute.resetPassword,arguments: {
         "email":email
       });
      }
      else {
        Get.defaultDialog(
            title: "Warring", middleText: "Invalid verifycode");
        statusrequest = StatusRequest.failure;
      }
    }
    else
      {
        Get.defaultDialog(
            title: "Warring", middleText: "Invalid verifycode");
        statusrequest = StatusRequest.failure;
      }
    update();
  }

  @override
  void onInit() {
    email=Get.arguments["email"];
    super.onInit();
  }

 
}
