import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/screen/homescreen.dart'; // For GetX localization and navigation

class Header extends StatelessWidget {
  final bool isLoggedIn;
  final HomecontrollerTmp mycontroller; // Your controller
  final MyServices servicecontroller; // Your service controller

  Header({required this.isLoggedIn, required this.mycontroller, required this.servicecontroller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLoggedIn
            ? _buildLoggedInButton(context)
            : _buildLoginButton(context),
        SizedBox(width: 50),
        _buildLogo(context),
      ],
    );
  }

  // Widget for when the user is logged in
  Widget _buildLoggedInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 120,
        height: 90,
        child: ElevatedButton(
          onPressed: () {
            // Add your action here
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff1696EE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  "hello".tr + mycontroller.name.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for when the user is not logged in
  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 110,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to sign-in page
            mycontroller.goToSignIn();
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff1696EE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:   [
              Icon(Icons.lock, color: Colors.white),
              SizedBox(height: 10),
              SizedBox(
                width: 110,
                child: Text(
                  "9".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the logo
  Widget _buildLogo(BuildContext context) {
    return InkWell(child: Image.asset(
      'assets/images/finalnewlogo.png', // Replace with your asset path
      height: 180,
    ),onTap: ()=>{
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
    )
    });
  }
}
