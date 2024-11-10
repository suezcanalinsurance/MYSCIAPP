import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/CheckPolicy_controller.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';

class CheckPolicy extends StatelessWidget {
  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp logincontroller = Get.put(LoginControllerImp());
  CheckPolicyControllerImp controller = Get.put(CheckPolicyControllerImp());

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MainAppBar(
        title: 'MY SCI',
        localcontroller: localcontroller,
      ),
      drawer: NavDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: GetBuilder<CheckPolicyControllerImp>(
            builder: (controller) => ListView(
              padding: EdgeInsets.all(20),
              children: [
                Header(
                  isLoggedIn: isLoggedIn,
                  mycontroller: mycontroller,
                  servicecontroller: myServices,
                ),
                SizedBox(height: 20),
                CustomTextTitleAuth(text: "Validate_document".tr),
                SizedBox(height: 10),
                CustomTextBodyAuth(text: "checktitle".tr),
                SizedBox(height: 15),

                // Policy No TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color
                    borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'polNo'.tr,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: controller.onpolicyNoChanged,
                  ),
                )
                ,
                SizedBox(height: 15),

                // Sticker No TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color
                    borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
                  ),
                  width: screenWidth * 0.8,
                  child: TextField(
                    decoration: InputDecoration(

                      labelText: 'barcode'.tr,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: controller.onstickerNoChanged,
                  ),
                ),
                SizedBox(height: 15),

                // Submit Button
                CustomButtomAuth(
                  text: "submit".tr,
                  onPressed: () {
                    controller.checkpolicy();
                  },
                  color: AppColor.primaryColor,
                ),
                SizedBox(height: 20),

                // Response Status
                HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget:
                    controller.statusRequest == StatusRequest.success
                        ? buildSuccessSection(controller)
                        : Row()
                ),
                SizedBox(height: 40),

                // Back Button
                CustomTextSignUpOrSignIn(
                  textone: "",
                  texttwo: "back".tr,
                  onTap: () {

                    controller.goToHome();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        mycontroller: mycontroller,
        servicecontroller: servicecontroller,
      ),
    );
  }

  // Success Section
  Widget buildSuccessSection(CheckPolicyControllerImp controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSuccessRow(Icons.safety_check, Colors.green, "IsValid".tr),
        buildSuccessRow(Icons.padding_outlined, AppColor.primaryColor,
            "PolicyNo".tr+  "    ${controller.polNo_res}"),
        buildSuccessRow(Icons.sticky_note_2, AppColor.primaryColor,
            "barcode".tr +  " ${controller.PrintedSerials_res}"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Icon(Icons.account_circle_sharp, color: AppColor.primaryColor),
              SizedBox(width: 8),
              SizedBox(
                width: 300,
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColor.black,
                  ),
                  "Insured".tr + "  ${controller.InsuName_res}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
   ,
        buildSuccessRow(Icons.date_range_rounded, AppColor.primaryColor,
           "StartDate".tr+ "  ${controller.StartDate_res}"),
        buildSuccessRow(Icons.date_range_rounded, AppColor.primaryColor,
            "EndDate".tr+ " ${controller.EndDate_res}"),
        buildSuccessRow(Icons.monetization_on, AppColor.primaryColor,
           "Insuranceamount".tr+ "  ${controller.Activecom_res1} ${controller.CurrName_res}"),

        buildSuccessRow(Icons.monetization_on, AppColor.primaryColor,
          "Installmentamount".tr+  " ${controller.Activecom_res} ${controller.CurrName_res}"),
        buildSuccessRow(Icons.ac_unit_rounded, AppColor.primaryColor,
           "Paymentstatus".tr + " ${controller.PaymentStatus_res}"),
      ],
    );
  }

  // Failure Section
  Widget buildFailureSection() {
    return Row(
      children: [
        Icon(Icons.error, color: Colors.red),
        SizedBox(width: 8),
        Text(
          "Thedocumentdoesnotexist".tr,
          style: TextStyle(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Helper to build Success Rows
  Widget buildSuccessRow(IconData icon, Color color, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
