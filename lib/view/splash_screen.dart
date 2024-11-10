import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/splash_controller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/fingerprint.dart';
import 'package:suezproduction/view/screen/Home.dart';
import 'package:suezproduction/view/screen/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() {
    SplashControllerImp controller = Get.put(SplashControllerImp());
    // ===============================================================================
    // Timer is used so that after 2 seconds the user is navigated to login screen
    // ===============================================================================
    Timer(
      // Duration of timer
      const Duration(seconds: 2),
      // function (what happens after the timer stops)
          () {
        if (controller.isLogin() == true) {
          controller.goToHome();
        } else {
          controller.goToLogin();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "suez".tr,
              style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.blue.shade900),
            ),
            Center(child: Text("تأسست في اكتوبر ١٩٧٩ و مسجلة تحت رقم (٥) بالهيئة\n العامة للرقابة المالية و خاضعة لرقابتها و أشرافها",
                style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.blue.shade900,)),)

          ],
        ),
      ),
    );
  }
}
