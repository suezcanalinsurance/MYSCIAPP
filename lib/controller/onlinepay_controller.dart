import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class OnLinepayController extends GetxController {

}

class OnLinepayControllerImp extends OnLinepayController {


  int currentPage = 0;

  MyServices myServices = Get.find() ;



}
