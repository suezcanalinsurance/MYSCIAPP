import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/AccidentReport.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/NewBranches.dart';
import 'package:suezproduction/view/screen/PriceOffer.dart';
import 'package:suezproduction/view/screen/PrivacyPolicy.dart';
import 'package:suezproduction/view/screen/ProducersPortalonline.dart';
import 'package:suezproduction/view/screen/contactus.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:suezproduction/view/screen/termssub.dart';

class NavDrawer extends StatelessWidget {
  final LocaleController localcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "menu".tr,
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.06),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/cover.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.paid_outlined),
            title: Text(
              "offer".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PriceOffer()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            title: Text(
              "ProducersPortalonline".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProducersPortalonline()),
            ),
          ),
          SizedBox(height: 10),

          ListTile(
            leading:  Image.asset(
              'assets/images/call.png',
              fit: BoxFit.cover,
              height: 22,
              width: 22, // You can set the width for a consistent size
            ),
            title: Text(
              "contact".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => contactus()),
            ),
          ),
         /* ListTile(
            leading: Icon(Icons.view_compact),
            title: Text(
              "about".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            ),
          ),
          if (localcontroller.isLogin()) ...[
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text(
                "Validate_document".tr,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckPolicy()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopify_rounded),
              title: Text(
                "E_Pay".tr,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnLinepay()),
              ),
            ),
          ],
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text(
              "branches".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewBranches()),
            ),
          ),
          SizedBox(height: 10),

          ListTile(
            leading: Icon(Icons.add_alert_rounded),
            title: Text(
              "acciedent".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccidentReportForm()),
            ),
          ),*/
          SizedBox(height: 10),

          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text(
              "PrivacyPolicy".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()),
            ),
          ),
          SizedBox(height: 10),


          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text(
              "Terms".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Terms()),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: ClipOval(
              child: Image.asset(
                localcontroller.myservices.sharedPreferences.getString("lang") == "ar"
                    ? AppImageAsset.en
                    : AppImageAsset.ar,
                width: 20,
              ),
            ),
            title: Text(
              localcontroller.myservices.sharedPreferences.getString("lang") == "ar"
                  ? "English (إنجليزي)"
                  : "Arabic (عربي)",
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () {
              final newLang = localcontroller.myservices.sharedPreferences.getString("lang") == "ar" ? "en" : "ar";
              localcontroller.changeLang(newLang);
            },
          ),
        ],
      ),
    );
  }
}
