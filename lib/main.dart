import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suezproduction/bindings/intialbindings.dart';
import 'package:suezproduction/core/constant/apptheme.dart';
import 'package:suezproduction/core/localization/translation.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initialServices();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: Size(375, 812),
          builder: (BuildContext context, Widget? child) {
            return   GetMaterialApp(
            translations: MyTranslation(),
            debugShowCheckedModeBanner: false,
            title: 'Suez Canal Insurance',
            locale: controller.language,
            theme:  controller.appTheme,
            initialBinding:InitialBindings() ,
            // routes: routes,
            getPages: routes,
            );}

        );
      },
    );

  }
}
