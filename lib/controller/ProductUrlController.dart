import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/sendEmailToEdara.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';

class ProductUrlController extends GetxController {
  int loadingPercentage = 0; // Regular variable
  late WebViewController webViewController;
  String? categoryname;
  String? url,enurl,email;
  final GlobalKey<FormState> formKeyitem = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  ScrollController scrollController = ScrollController();
  SendEmailToedara sendemailtoedara=SendEmailToedara(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  void updateLoadingProgress(int progress) {
    loadingPercentage = progress;
    update(); // Manually call update to trigger UI rebuilds in GetX
  }
  @override
  initialData() {
    // TODO: implement initialData


    categoryname = translateDatabase(Get.arguments["categories_name"],Get.arguments["categories_name_en"]);
    url = Get.arguments["url"];
    enurl = Get.arguments["enurl"];
    email = Get.arguments["email"];

    update();
  }
  @override
  void onInit() {

    super.onInit();
   initialData();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x0ff888ff))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          updateLoadingProgress(progress); // Update progress manually
        },
        onPageStarted: (String url) {
          updateLoadingProgress(0); // Reset progress
        },
        onPageFinished: (String url) {
          updateLoadingProgress(100); // Full progress when page finishes
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.facebook.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(
          translateDatabase(url,enurl)));
  }
  void sendEmail() async{
    final String name = nameController.text;
    final String subject = subjectController.text;

    var response = await sendemailtoedara.postData(name,subject, myServices.sharedPreferences.getString("email")!,email!);

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {

    }
  }
}
