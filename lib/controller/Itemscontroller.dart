
import 'package:flutter/widgets.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/item_data.dart';
import 'package:get/get.dart';
import 'package:suezproduction/data/datasource/remote/sendEmailToEdara.dart';

abstract class Itemscontroller extends GetxController {
initialData();
changeCat(int val, String catval);
productDetail(String productId);
}

class ItemcontrollerTmp extends Itemscontroller
{
  final GlobalKey<FormState> formKeyitem = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List categories = [];
  List data = [];
  ItemData itemData=ItemData(Get.find());
  SendEmailToedara sendemailtoedara=SendEmailToedara(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  int? selectedCat;
  String? catid;
  String? categoryname;
  String? email;


  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }
  final double _height = 1.0;

  void animateToIndex(int index) {
    scrollController.animateTo(
      index  * 200,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
  @override
  initialData() {

    // TODO: implement initialData
    categories=Get.arguments["categories"];
    selectedCat=Get.arguments["selectedcat"];
    catid=Get.arguments["catid"];
    categoryname=Get.arguments["categoryname"];
    email=Get.arguments["email"];
    update();

    getitems(catid!);
    animateToIndex(int.parse(catid!));
    update();
  }



  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getitems(catid!);
    update();
  }


  getitems(String cat)  async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemData.getData(cat);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);

      }   if (response['status'] == "nodata") {
        statusRequest = StatusRequest.noData ;
      }else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();


  }

  void sendEmail() async{
    final String name = nameController.text;
    final String subject = subjectController.text;

    var response = await sendemailtoedara.postData(name,subject, myServices.sharedPreferences.getString("email")!,email!);

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {

    }
    }


  productDetail(productId){
    // TODO: implement gotoitems
    Get.toNamed(AppRoute.productdetail, arguments: {
      "productId":productId
    });
  }
}
