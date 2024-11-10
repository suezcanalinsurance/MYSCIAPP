import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/auth/ReActivationController.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
class ReActivation extends StatelessWidget {
const ReActivation({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  Get.put(ReActivationControllerImp());
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      title: Text('17'.tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey)),
    ),
    body: WillPopScope(
      onWillPop: alertExitApp,
      child: GetBuilder<ReActivationControllerImp>(builder:
          (controller)=>
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "hello".tr+ " \n ${controller.email}".tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text:"active".tr ),
                  const SizedBox(height: 15),

                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: "",
                    texttwo: "toactive".tr,
                    onTap: () {
                      controller.goto_verify();
                    },
                  ),
                ]),
              ) )

      ,),
  );
}
}
