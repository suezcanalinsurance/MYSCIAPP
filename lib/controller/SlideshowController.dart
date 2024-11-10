import 'package:get/get.dart';
import 'dart:async';

class OpacityController extends GetxController {
  double opacity = 1.0;

  @override
  void onInit() {
    super.onInit();
    startFade(); // بدء تحريك الشفافية عند تحميل التطبيق
  }

  void startFade() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      // تغيير الشفافية كل 3 ثواني
      fadeOpacity();
    });
  }

  void fadeOpacity() {
    if (opacity == 0) {
      opacity = 1; // إذا كانت الشفافية 1.0، تخفيضها إلى 0.3
    } else {
      opacity = 0; // إذا كانت الشفافية 0.3، زيادتها إلى 1.0
    }
    update(); // تحديث واجهة المستخدم
  }
}
