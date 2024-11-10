
import 'package:get/get.dart';


abstract class CheckPolicyResultController extends GetxController {

}

class CheckPolicyResultControllerImp extends CheckPolicyResultController {
  List data = [];
  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }
  @override
  initialData() {

    // TODO: implement initialData
      data=Get.arguments["su"];
      update();

  }
}