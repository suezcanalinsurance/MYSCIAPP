import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/CheckPolicyData.dart';
import 'package:suezproduction/data/model/policyInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class CheckPolicyController extends GetxController {

}

class CheckPolicyControllerImp extends CheckPolicyController {


  GlobalKey<FormState> formstatCheckLogin = GlobalKey<FormState>();
  var  policyNo='';
  var  stickerNo='';
  List data = [];
  CheckPolicyData checkpolicyData = new CheckPolicyData(Get.find());
  StatusRequest statusRequest =StatusRequest.notfound;
  late policyInfoModel policyInfo_model;
  String status="";
  String polNo_res="";
  String PaymentStatus_res="";
  String EndDate_res="";
  String CurrName_res="";
  String StartDate_res="";
  String InsuName_res="";
  String PrintedSerials_res="";
  String Activecom_res="";
  String Activecom_res1="";

  @override

  void onpolicyNoChanged(String value) {
    policyNo = value;
  }

  void onstickerNoChanged(String value) {
    stickerNo = value;
  }

  @override
  checkpolicy() async {
    if (policyNo.isEmpty) {
      Get.snackbar("error".tr, "policyerror".tr);
      return;
    }
    if (stickerNo.isEmpty) {
      Get.snackbar("error".tr, "stickererror".tr);
      return;
    }

      statusRequest = StatusRequest.loading;
      update();
      var response = await checkpolicyData.postData(
          policyNo, stickerNo );
     // print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          status="success";
           data.addAll(response['data']);
           policyInfo_model= policyInfoModel.fromJson(data[0]);
           polNo_res=policyInfo_model.polNo!;
          PaymentStatus_res=policyInfo_model.paymentStatus!;
          EndDate_res=policyInfo_model.endDate!;
          StartDate_res=policyInfo_model.startDate!;
          InsuName_res=policyInfo_model.insuName!;
          PrintedSerials_res=policyInfo_model.printedSerials!;
          Activecom_res=policyInfo_model.activecom!;
          Activecom_res1=policyInfo_model.activecom1!;
          CurrName_res=policyInfo_model.CurrName!;

          // Get.toNamed(AppRoute.CheckPolicy_Result, arguments: {
          //   "data":data
        //   });
        }
        else if (response['status'] == "notfound") {
          statusRequest = StatusRequest.notfound;
          status="faild";
          Get.defaultDialog(
              title: "Warring", middleText: "هذه الوثيقة غير موجودة");

        } else {
          Get.defaultDialog(
              title: "Warring", middleText: "failure");
          statusRequest = StatusRequest.failure;
        }
      }
      update();










  }

  @override
  void onInit() {
    clearData();  // Reset all data when the page is initialized
    super.onInit();
    update();
    super.onInit();
  }

  @override
  goToHome() {
    clearData();
    Get.offNamed(AppRoute.home);
  }
  @override
  void dispose() {

    clearData();  // Clear data when the controller is disposed
    super.dispose();
  }

  // Function to clear data
  void clearData() {
    policyNo = '';  // Clear policy number
    stickerNo = '';  // Clear sticker number
    statusRequest = StatusRequest.none;  // Reset status request
    data.clear();  // Clear the data list
    polNo_res = '';
    PaymentStatus_res = '';
    EndDate_res = '';
    StartDate_res = '';
    InsuName_res = '';
    PrintedSerials_res = '';
    Activecom_res = '';
    Activecom_res1 = '';
    CurrName_res = '';
    status = '';
    update();  // Ensure UI is updated
  }

}
