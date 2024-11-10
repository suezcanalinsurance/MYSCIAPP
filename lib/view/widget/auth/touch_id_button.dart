import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/TouchIDController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';

class TouchIDButton extends StatelessWidget {


  TouchIDController controller = Get.put(TouchIDController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.activeauthenticateUserWithTouchID,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/images/touch_ID.png',
              height: 40,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "تفعيل البصمة للدخول ",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


class LoginTouchIDButton extends StatelessWidget {


  TouchIDController controller = Get.put(TouchIDController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.authenticateUserWithTouchID,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/images/touch_ID.png',
              height: 40,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "الدخول عن طريق البصمة ",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}