import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/core/functions/validinput.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/logoauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    final    LoginControllerImp controller = Get.put(LoginControllerImp());

    final double screenWidth = MediaQuery.of(context).size.width;

    LocaleController localcontroller = Get.put(LocaleController());

    return  Scaffold(
        appBar:

        MainAppBar(
          title: "loginin".tr,
          localcontroller: localcontroller,
        ),

        body: WillPopScope(
          onWillPop:ExitApp,
          child:  HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget:Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(

                    child:  ListView(children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "11".tr),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(labelText: '18'.tr),
                        onChanged: controller.onEmailChanged,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: '19'.tr),
                        obscureText: true,
                        onChanged: controller.onPasswordChanged,
                      ),

                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),


                      CustomButtomAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          },
                          color: AppColor.primaryColor),
                      const SizedBox(height: 10),

                      //     controller.StoredPassword !=null? LoginTouchIDButton():Row(),




                      const SizedBox(height: 30),
                      CustomTextSignUpOrSignIn2(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                      SizedBox(height: 50,),
                      FloatingActionButton.extended(
                        onPressed: () {
                          // Action to be taken when the button is pressed
                          controller.gotohome();

                        },
                        icon: Icon(Icons.account_circle),
                        label: Text( "39".tr,style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03)),
                        backgroundColor:  AppColor.kGreenColor, // Background color of the button
                      )


                      /*        CustomTextSignUpOrSignIn(
                          textone: "",
                          texttwo: "رجوع",
                          onTap: () {
                            controller.gotohome();
                          },
                        )*/
                    ])),
              ) ),
        ));
  }
}
