import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  
  late SharedPreferences sharedPreferences ; 

  Future<MyServices> init() async {
      sharedPreferences =   await SharedPreferences.getInstance() ;
  return this ; 
  }

}


Future<void> FireMessagingNackgroundHandler(RemoteMessage message)
async {
  print(message.messageId);
}
initialServices() async  {
  await Get.putAsync(() => MyServices().init()) ;
  FirebaseMessaging.onBackgroundMessage(FireMessagingNackgroundHandler);
}