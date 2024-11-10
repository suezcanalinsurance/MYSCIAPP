import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProducersPortalonline extends StatefulWidget {
  const ProducersPortalonline({Key? key}) : super(key: key);

  @override
  State<ProducersPortalonline> createState() => _OnlinePayState();
}

class _OnlinePayState extends State<ProducersPortalonline> {
  var loadingPercentage = 0;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xff9dd6fc))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
              // جلب التوكن من Local Storage بعد انتهاء تحميل الصفحة

            });
          },
          onWebResourceError: (WebResourceError error) {
            print('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.facebook.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          translateDatabase('https://sci-broker.com/admindemo/www/login/index/',
              'https://sci-broker.com/admindemo/www/login/index/en')));
  }



  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Token saved in SharedPreferences: $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProducersPortalonline".tr),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
