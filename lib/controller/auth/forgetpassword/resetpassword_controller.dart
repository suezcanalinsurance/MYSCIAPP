import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/auth/forgetpassword/resetpasswordData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate_restpassword = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;
  ResetpasswordData resetpassdata=new ResetpasswordData(Get.find());
  StatusRequest statusrequest=StatusRequest.none;
  var  email;
  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() async {

    if (formstate_restpassword.currentState!.validate()) {
      statusrequest=StatusRequest.loading;
      update();
     if (password.text==repassword.text) {
       var response=await resetpassdata.postdata(email!, password.text);
       statusrequest=handlingData(response);
       if (statusrequest==StatusRequest.success) {
         if (response['status'] == "success") {
           Get.offNamed(AppRoute.successResetpassword);
         }
         else {
           Get.defaultDialog(
               title: "Warring", middleText: "Invalid Reset password");
           statusrequest = StatusRequest.failure;
           update();
         }
       }
       else {
         Get.defaultDialog(
             title: "Warring", middleText: "Invalid Reset password");
         statusrequest = StatusRequest.failure;
         update();
       }
     }

     else
       {
         Get.defaultDialog(title: "خطا",middleText: "كلمتى المرور غير متطابقين");
         statusrequest = StatusRequest.none;
         update();
       }
    } else {

    }
  }

  @override
  void onInit() {
    email=Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
