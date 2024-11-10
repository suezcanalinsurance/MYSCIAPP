import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/CheckPolicyData.dart';
import 'package:suezproduction/data/model/policyInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class ClaimPageController extends GetxController {

}

class ClaimPageControllerImp extends ClaimPageController {


  GlobalKey<FormState> formstatClaimPage = GlobalKey<FormState>();
  late TextEditingController policyNo;
  late TextEditingController chassisNo;
String polNo="";
String chasNo="";

  @override
  getpolicy() async {

    if (formstatClaimPage.currentState!.validate()) {
      polNo="";
      chasNo="";
      update();
polNo=policyNo.text;
chasNo=chassisNo.text;

Get.offAllNamed(AppRoute.ClaimpageResult,
          arguments: {
        "policyNo":polNo ,
         "chassisNo":chasNo ,
          });
      update();
    }

  }

  @override
  void onInit() {

    policyNo = TextEditingController();
    chassisNo = TextEditingController();
update();
    super.onInit();
  }

  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }
  @override
  void dispose() {
    policyNo.dispose();
    chassisNo.dispose();

    super.dispose();
  }

}
