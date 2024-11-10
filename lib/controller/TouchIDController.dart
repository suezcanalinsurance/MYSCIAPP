import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/secure_storage.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/auth/logindata.dart';

class TouchIDController extends GetxController
{
  SigninData signindata = new SigninData(Get.find());
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  Future<void> authenticateUserWithTouchID() async {
    final localAuthenticationauth = LocalAuthentication();
    bool isAuthorizedauth = false;
    try {
      isAuthorizedauth = await localAuthenticationauth.authenticate(
        localizedReason: "Please authenticate to continue",
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (exception) {}
    if (isAuthorizedauth) {
      SecureStorage storageauth = SecureStorage();
      String? email = await storageauth.getEmail();
      String? password = await storageauth.getPassword();

      if (email != null &&
          password != null &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        //_saveUser here
        await _loginUserByFinger(email, password);
      } else {

      }
    } else {
      //////البصمة غير مفعلة علي جهازك


    }
  }

  Future<void> activeauthenticateUserWithTouchID() async {
    final localAuthentication = LocalAuthentication();
    bool isAuthorized = false;
    try {
      isAuthorized = await localAuthentication.authenticate(
        localizedReason: "Please authenticate to continue",
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (exception) {}
    if (isAuthorized) {
      print("sucess");

      SecureStorage storage = SecureStorage();
      storage.setEmail(myServices.sharedPreferences.getString("email").toString());
      storage.setPassword(myServices.sharedPreferences.getString("password").toString());

      Get.dialog(AlertDialog(
        title: Text(' العملية ناجحة '),
        content: Text('تم تفعيل الدخول بالبصمة علي جهازك بنجاح'),
        actions: <Widget>[
          TextButton(
            child: Text('إغلاق'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ));

    } else {

    }
  }



  _loginUserByFinger(String email, String password) async {
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
      }
    }
  }
}