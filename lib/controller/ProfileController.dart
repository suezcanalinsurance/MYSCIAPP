import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';

import 'package:suezproduction/data/datasource/remote/profile_data.dart';
import 'package:suezproduction/data/model/ProducerModel.dart';

  abstract class ProfileController extends GetxController {

}
class ProfileControllerTmp extends ProfileController {

  late StatusRequest statusRequest = StatusRequest.loading;
  late List  userLists=[];
  MyServices myServices=Get.find();

  ProfileData Profiledata = ProfileData(Get.find());
  GlobalKey<FormState> formstate_asd = GlobalKey<FormState>();

  late TextEditingController email;
  void onInit()
  {
    email = TextEditingController();
    getData();
    super.onInit();
  }



  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await Profiledata.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        userLists.addAll(response['data']);
        print(userLists);
       }  else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  void searchproducer() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await Profiledata.searchData(email.text);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        userLists=[];
        userLists.addAll(response['data']);

      }  else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }
}