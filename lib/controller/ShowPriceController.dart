import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/auth/VerifyCodeSignUpData.dart';
import 'package:get/get.dart';

abstract class ShowPriceController extends GetxController {

}

class ShowPriceControllerImp extends ShowPriceController {
  String? price;


  @override
  void onInit() {
    price=Get.arguments["TotalPrem"];
    super.onInit();
  }


}
