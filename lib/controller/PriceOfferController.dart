import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/PriceOfferData.dart';
import 'package:suezproduction/data/datasource/remote/sendEmailToEdara.dart';

class PriceOfferController extends GetxController {
var offername = '';
var offercardId = '';
var offerPassport='';
var offeremail = '';
var offertel = '';
var offeraddress = '';
var offerInsKind='';
var offerInsName='';
var offeramount='0';
var offersubject='';
var emailto = 'crm@sci-egypt.net';


List<Map<String, String>> selectedInsurances = [


];

  var acciedentsubject = '';
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  // A flag to determine if the form was successfully submitted
  var isSuccess = false.obs;
PriceOfferData priceofferdata=PriceOfferData(Get.find());
  // This method will send the data to the API
  Future<void> sendOfferPrice() async {
    statusRequest = StatusRequest.loading;
    update();
    //var response = await priceofferdata.postData(offername,offercardId,offeremail,offeraddress==''?'_':offeraddress,offertel==''?'_':offertel==''?'_':offertel,offerInsKind,offerInsName,offeramount,offersubject==''?'_':offersubject,emailto);
    //statusRequest = handlingData(response);





  var  response = await priceofferdata.postDataEmail(offername,offercardId,offerPassport,offeremail,offeraddress==''?'_':offeraddress,offertel==''?'_':offertel==''?'_':offertel,offerInsKind,offerInsName,offeramount,offersubject==''?'_':offersubject,emailto);

    if (response['status'] =="success") {

        statusRequest = StatusRequest.success;
        update();
      // On success, set isSuccess to true and hide the form
      isSuccess.value = true;
      //  Get.snackbar('Success', 'Accident report sent successfully');
    } else {
      isSuccess.value = false;
      Get.snackbar('خطا', response['status']);
    }


  }


  @override
  void onInit() {
    super.onInit();
    _loadEmailFromSharedPreferences();
  }

  void onOfferNameChanged(String value) {
    offername = value;
  }

  void onOfferEmailChanged(String value) {
    offeremail = value;
  }


  void onOfferTelChanged(String value) {
    offertel = value;
  }

  void onOfferAddressChanged(String value) {
    offeraddress = value;
  }

void onOfferAmountChanged(String value) {
  offeramount = value;
}
void onoffercardIdChanged(String value) {
  offercardId = value;
}

void onofferPassportChanged(String value) {
  offerPassport = value;
}



  Future<void> _loadEmailFromSharedPreferences() async {


    if (myServices.sharedPreferences.getString("email")!="") {
      offeremail = myServices.sharedPreferences.getString("email")!;
    }

    if (myServices.sharedPreferences.getString("phone")!="") {
         offertel = myServices.sharedPreferences.getString("phone")!;
    }

  }

}
