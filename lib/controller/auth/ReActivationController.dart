
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/auth/ReactiveCodeData.dart';

abstract class ReActivationController extends GetxController {
  goto_verify();
}

class ReActivationControllerImp extends ReActivationController {
  ReactiveCodeData reactiveData = new ReactiveCodeData(Get.find());
  StatusRequest? statusrequest;
  String? email;

  @override
  void onInit() {
    // TODO: implement onInit

    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  goto_verify() async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await reactiveData.postData(email!);

    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {

        Get.offNamed(AppRoute.verfiyCodeSignUp,arguments: {
          "email":email!
        });
      }
      else {
        Get.defaultDialog(
            title: "Warring", middleText: "Invalid Re Active");
        statusrequest = StatusRequest.failure;
      }
    }
    update();


  }
}