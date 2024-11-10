import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/datasource/static/static.dart';

abstract class AboutUsController extends GetxController {

}

class AboutUsControllerImp extends AboutUsController {


  int currentPage = 0;

  MyServices myServices = Get.find() ;

  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }

  getofacbook() async {
    final Uri url = Uri.parse('https://www.facebook.com/SCI.1979');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  getoinstagram() async {
    final Uri url = Uri.parse('https://www.instagram.com/sci.1979/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }


  getolinkedin() async {
    final Uri url = Uri.parse('https://eg.linkedin.com/company/sci-1979');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    
    super.onInit();
  }
}
