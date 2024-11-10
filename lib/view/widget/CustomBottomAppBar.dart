import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/Profile.dart';
import 'package:suezproduction/view/screen/homescreen.dart'; // For localization and navigation with GetX

class CustomBottomAppBar extends StatelessWidget {
  final HomecontrollerTmp mycontroller;
  final ServiceController servicecontroller;

  CustomBottomAppBar({required this.mycontroller, required this.servicecontroller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left-side buttons
          Row(
            children: [
              _buildBottomNavButton(
                context,
                icon: Icons.home,
                label: "home".tr,
                onPressed: () {
                  // Add your home navigation logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              _buildBottomNavButton(
                context,
                icon: Icons.view_compact,
                label: "about".tr,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
            ],
          ),
          Spacer(),
          // Right-side buttons
          Row(
            children: [
              _buildBottomNavButton(
                context,
                icon: Icons.perm_contact_calendar_rounded,
                label: "profile".tr,
                onPressed: () {
                  servicecontroller.isLogin()
                      ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  )
                      : mycontroller.goToSignIn();
                },
              ),
              servicecontroller.isLogin()
                  ? _buildBottomNavButton(
                context,
                icon: Icons.output_sharp,
                label: "exit".tr,
                onPressed: () {
                  mycontroller.sharedrefrense_clear();
                },
              )
                  : _buildBottomNavButton(
                context,
                icon: Icons.account_circle_sharp,
                label: "login".tr,
                onPressed: () {
                  mycontroller.goToSignIn();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build the bottom navigation button
  Widget _buildBottomNavButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onPressed}) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Color(0xff1696EE)),
          Text(label, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
