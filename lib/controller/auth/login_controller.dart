import 'package:flutter/material.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/secure_storage.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/auth/logindata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {



  SigninData signindata = new SigninData(Get.find());
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  //  String? StoredEmail;
   // String? StoredPassword;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  var email = '';
  var password = '';


  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  @override
  login() async {



    if (email.isEmpty) {
      Get.snackbar('Error', 'Email cannot be empty');
      return;
    }
    if (password.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty');
      return;
    }

      statusRequest = StatusRequest.loading;
      update();

      var response = await signindata.postData(email, password);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {


        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['user_name']);
          myServices.sharedPreferences
              .setString("password", response['data']['users_password']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences.setBool("islog", true);
          myServices.sharedPreferences.setString("step", "3");
          Get.offNamed(AppRoute.home, arguments: {"email": email});
          statusRequest = StatusRequest.success;
          update();
        } else {
          Get.defaultDialog(title: "رسالة خطأ", middleText: "البريد الألكترونى أو كلمة المرور غير صحيحة");
          statusRequest = StatusRequest.failure;
          update();
          if (response['status'] == "المستخدم صحيح ولكنه غير مفعل") {
            Get.offNamed(AppRoute.ReActivation,
                arguments: {"email": email});
          }
        }
      } else {
        Get.defaultDialog(title: "Warring", middleText: "there is problem");
        statusRequest = StatusRequest.failure;
      }

  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {

    update();
    super.onInit();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  gotohome() {
    Get.toNamed(AppRoute.home);
  }


}
