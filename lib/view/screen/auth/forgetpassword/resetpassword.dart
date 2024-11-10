import 'package:suezproduction/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/validinput.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'ResetPassword',
          style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusrequest,
            widget: Form(
              key: controller.formstate_restpassword,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "35".tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: "35".tr),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
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
                    iconData: Icons.lock_outline,
                    labeltext: "19".tr,
                  ),
                  CustomTextFormAuth(
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
                    mycontroller: controller.repassword,
                    hinttext: "Re" + " " + "13".tr,
                    iconData: Icons.lock_outline,
                    labeltext: "19".tr,
                  ),
                  CustomButtomAuth(
                    text: "33".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                    color: AppColor.primaryColor,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
