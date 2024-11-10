import 'package:flutter/gestures.dart';
import 'package:suezproduction/controller/auth/signup_controller.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/core/functions/validinput.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {

  LocaleController localcontroller = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: MainAppBar(
        title: "17".tr,
        localcontroller: localcontroller,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) {
            return controller.statusRequest == StatusRequest.loading
                ? Center(child: const Text("loading..."))
                : controller.statusRequest == StatusRequest.offlinefailure
                ? Center(child: const Text("No Internet Connection ..."))
                : Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate_signup,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "10".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "24".tr),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, "name");
                      },
                      mycontroller: controller.username,
                      hinttext: "23".tr,
                      iconData: Icons.person_outline,
                      labeltext: "20".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 40, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "12".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "18".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 7, 11, "phone");
                      },
                      mycontroller: controller.phone,
                      hinttext: "22".tr,
                      iconData: Icons.phone_android_outlined,
                      labeltext: "21".tr,

                    ),
                    CustomTextFormAuth(
                      obscureText: controller.isPasswordVisible,
                      isNumber: false,
                      valid: (val) {
                        if (val == null || val.isEmpty) {
                          return "ErrorSingup1".tr;
                        } else if (val.length < 8) {
                          return "ErrorSingup2".tr;
                        } else if (!RegExp(r'[A-Za-z]').hasMatch(val) ||
                            !RegExp(r'\d').hasMatch(val)) {
                          return "ErrorSingup3".tr;
                        }
                        return null;
                      },
                      mycontroller: controller.password,
                      hinttext: "13".tr,
                      iconData: controller.isPasswordVisible ? Icons.visibility_off  : Icons.visibility,
                      labeltext: "19".tr,
                      onTapIcon: ()=>{
                      controller.togglePasswordVisibility()  // استدعاء الدالة لتبديل الرؤية
                      },
                    ),
                    CustomTextFormAuth(
                      obscureText: controller.isPasswordVisible,
                      isNumber: false,
                      valid: (val) {
                        if (val != controller.password.text) {
                          return "ErrorSingup4".tr;
                        }
                        return null;
                      },
                      mycontroller: controller.rePassword,
                      hinttext: "ReenterPassword".tr,
                      iconData: controller.isPasswordVisible ? Icons.visibility_off  : Icons.visibility,
                      labeltext: "ReenterPassword".tr,
                      onTapIcon: ()=>{
                        controller.togglePasswordVisibility()  // استدعاء الدالة لتبديل الرؤية
                      },
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.isChecked,
                          onChanged: (bool? value) {
                            controller.toggleCheckbox(value);
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "agree".tr,
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Terms".tr,
                                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _showTermsAndConditions(context);
                                    },
                                ),
                                TextSpan(
                                  text: "and".tr,
                                ),
                                TextSpan(
                                  text: "PrivacyPolicy".tr,
                                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _showPrivacyPolicy(context);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomButtomAuth(
                      text: "17".tr,
                      onPressed: controller.isChecked ? () {
                        controller.signUp();
                      } : null,
                      color: AppColor.primaryColor,
                    ),
                    const SizedBox(height: 40),
                    CustomTextSignUpOrSignIn2(
                      textone: "25".tr,
                      texttwo: "26".tr,
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showTermsAndConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Terms".tr),
          content: SingleChildScrollView(
            child: Text("termssub".tr),
          ),
          actions: [
            TextButton(
              child: Text("OK".tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("PrivacyPolicy".tr),
          content: SingleChildScrollView(
            child: Text("Policysub".tr),
          ),
          actions: [
            TextButton(
              child: Text("OK".tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
