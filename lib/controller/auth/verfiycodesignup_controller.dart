import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/auth/VerifyCodeSignUpData.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifycode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {  
  String? email;
  List data = [];
  VerifyCodeSignUpData Verifysignupdata = new VerifyCodeSignUpData(Get.find());
  StatusRequest? statusRequest;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifycode) async {
    print(verifycode);
    statusRequest = StatusRequest.loading;
    update();
    var response = await Verifysignupdata.postData(email!, verifycode);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       // data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      }
     else {
        Get.defaultDialog(
            title: "Warring", middleText: "Invalid verifycode");
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  @override
  void onInit() {
    email=Get.arguments["email"];
    super.onInit();
  }

 
}
