 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnLinepay extends StatefulWidget {
  const OnLinepay({Key? key}) : super(key: key);

  @override
  State<OnLinepay> createState() => _OnlinePayState();
}

class _OnlinePayState extends State<OnLinepay> {
  var loadingPercentage = 0;
  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();

    controller..setJavaScriptMode(JavaScriptMode.unrestricted);
    controller..setBackgroundColor(const Color(0xff9dd6fc));
    controller..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            setState(() {
              loadingPercentage = progress;
            });
            print("onProgressChanged: ${progress}");
          },
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.facebook.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "${translateDatabase('https://sci-ebusiness.com/Electronicpay/pages/dashboard.aspx','https://sci-ebusiness.com/Electronicpay/pages/dashboard.aspx?lang=en')}"));
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title:  Text("E_Pay".tr),
        ),
        body:  Stack(
      children: [
      WebViewWidget(
      controller: controller,                     // MODIFY
      ),
      if (loadingPercentage < 100)
      LinearProgressIndicator(
      value: loadingPercentage / 100.0,
      ),
      ],
      ),
      );
    }

}




/*    return Stack(
      children: [
        WebViewWidget(
          controller: controller,                     // MODIFY
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );*/