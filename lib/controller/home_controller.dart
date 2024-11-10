import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/secure_storage.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class Homecontroller extends GetxController{
  initialData();
  getData();
gotoitems(List categories,int selectedcat, String categoryid,String categoryname,String email);
}

class HomecontrollerTmp extends Homecontroller
{
  MyServices myServices=Get.find();
  String? id;
  String? name;
  String? lang;
  HomeData homeData = HomeData(Get.find());
bool? islog;

  ////////////////////////////////
  List categories = [];
  List items = [];
  List items_discount = [];

     String? StoredEmail;
     String? StoredPassword;
  sharedrefrense_clear()
  {
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setBool("islog",false);
    Get.offNamed(AppRoute.login);
  }
  late StatusRequest statusRequest;
  initialData()
  {
    id=myServices.sharedPreferences.getString("id");
    name=myServices.sharedPreferences.getString("username");
    lang = myServices.sharedPreferences.getString("lang");
    islog = myServices.sharedPreferences.getBool("islog");
 update();


  }
  void requestPermission() async{
    FirebaseMessaging message=FirebaseMessaging.instance;
    NotificationSettings settings=await message.requestPermission(

        alert: true,announcement: false,badge: true,carPlay: true,sound: true,criticalAlert: true
    );

    if (settings.authorizationStatus==AuthorizationStatus.authorized) {
      print("user authorized");
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification?.title);
      print(message.notification?.body);
    });
  }
  void onInit()
  {
    requestPermission();
    initialData();
    getData();
    getStoredData();
    super.onInit();
    update();
  }

getStoredData() async{
  SecureStorage storage = SecureStorage();
  StoredEmail = await storage.getEmail();
  StoredPassword = await storage.getPassword();

}
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['data']['categories']);
        items.addAll(response['data']['items']);
        items_discount.addAll(response['data']['items_discount']);
      }  else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  gotoitems(categories, selectedcat, categoryid,categoryname,email) {
    // TODO: implement gotoitems
  Get.toNamed(AppRoute.items, arguments: {
"categories":categories,
    "selectedcat":selectedcat,
    "catid": categoryid,
    "categoryname":categoryname,
    "email":email
  });

  update();
  }

  producerurl(categories_name, categories_name_en, url,enurl,email) {
    // TODO: implement gotoitems
   Get.toNamed(AppRoute.ProductUrl, arguments: {
      "categories_name":categories_name,
      "categories_name_en":categories_name_en,
      "url": url,
      "enurl":enurl,"email":email
    });

    update();
  }
}
