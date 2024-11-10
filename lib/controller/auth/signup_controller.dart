import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/auth/signupData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate_signup = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController rePassword;

  List data = [];
  SignupData signupdata = new SignupData(Get.find());
  StatusRequest? statusRequest;
  bool isChecked = false;

  void toggleCheckbox(bool? value) {
    isChecked = value ?? false;
    update();
  }
  bool isPasswordVisible = true;

  // دالة لتبديل رؤية كلمة المرور
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update(); // تحديث الواجهة
  }
  @override
  signUp() async {
    if (formstate_signup.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
       update();
      var response = await signupdata.postData(
          username.text, password.text, email.text, phone.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          data.addAll(response['data']);

          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else if (response['status'] == "exist_before") {
          statusRequest = StatusRequest.ExitEmail;
          Get.defaultDialog(
              title: "Warring", middleText: "Email Or phone is Exit");
        } else {
          Get.defaultDialog(title: "Warring", middleText: "failure");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    rePassword=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
