import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/PriceOfferController.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';




class PriceOffer extends StatelessWidget {
  final PriceOfferController controller = Get.put(PriceOfferController());
  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp  logincontroller= Get.put(LoginControllerImp());

  @override

  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();

    return   Scaffold(
      appBar: MainAppBar(
        title: 'MY SCI',
        localcontroller: localcontroller,
      ),
      drawer: NavDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:  GetBuilder<PriceOfferController>(
          builder: (controller) =>SafeArea(
          child: HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget:SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    child: Column(

                children: [

                  Header(
                    isLoggedIn: isLoggedIn,
                    mycontroller: mycontroller,
                    servicecontroller: myServices,
                  ),
                  CustomTextTitleAuth(text: "offer".tr),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white.withOpacity(0.50),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(() {
                        if (controller.isSuccess.value) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
                                SizedBox(height: 20),
                                Text(
                                  'sucessmessage'.tr,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.isSuccess.value = false;
                                    controller.offername = '';
                                     controller.offerPassport = '';
                                  //  controller.offertel = '';
                                    controller.offeraddress = '';
                                    controller.offeramount = '';
                                    controller.offersubject = '';
                                    controller.offercardId= '';
                                  },
                                  child: Text('anotheroffer'.tr),
                                ),
                              ],
                            ),
                          );
                        }

                        return Column(
                          children: [
                            Text(
                              'insurance'.tr,
                              style: TextStyle(color: Colors.black),
                            ),
                            MultiSelectDialogField(
                              items: InsList
                                  .map((item) => MultiSelectItem(item, '${translateDatabase(item['InsName'], item['InsName_en'])}'))
                                  .toList(),
                              title: Text('insurance'.tr),
                              selectedColor: Colors.blue,
                              onConfirm: (results) {
                                controller.selectedInsurances = List<Map<String, String>>.from(results);
                                // Handle selected data
                                controller.offerInsKind = controller.selectedInsurances.map((item) => item['InsKind'] ?? '').join(", ");
                                controller.offerInsName = controller.selectedInsurances.map((item) => item['InsName'] ?? '').join(", ");
                              },
                            )
                            ,
                            TextField(
                              decoration: InputDecoration(labelText: "name".tr),
                              controller: TextEditingController(text: controller.offername),
                              onChanged: controller.onOfferNameChanged,
                            ),
                              TextField(

                                decoration: InputDecoration(labelText: "card".tr),
                                keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(14),// يسمح فقط بالأرقام
                                ],
                                controller: TextEditingController(text: controller.offercardId),
                                onChanged: controller.onoffercardIdChanged,
                              ),
                            TextField(

                              decoration: InputDecoration(labelText: "passport".tr),

                              controller: TextEditingController(text: controller.offerPassport),
                              onChanged: controller.onofferPassportChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "18".tr),
                              controller: TextEditingController(text: controller.offeremail),
                              onChanged: controller.onOfferEmailChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "21".tr),
                              keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),// يسمح فقط بالأرقام
                              ],
                              controller: TextEditingController(text: controller.offertel),
                              onChanged: controller.onOfferTelChanged,
                            ),
                            /*  TextField(
                              decoration: InputDecoration(labelText: "address".tr),
                              controller: TextEditingController(text: controller.offeraddress),
                              onChanged: controller.onOfferAddressChanged,
                            ),
                           TextField(
                              decoration: InputDecoration(labelText: "amount".tr),
                              keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // يسمح فقط بالأرقام
                              ],
                              controller: TextEditingController(text: controller.offeraddress),
                              onChanged: controller.onOfferAmountChanged,
                            ),*/
                            TextField(
                              decoration: InputDecoration(
                                labelText: "offersubject".tr,
                                alignLabelWithHint: true,
                              ),
                              onChanged: (value) => controller.offersubject = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              minLines: 5,
                            ),
                            SizedBox(height: 20),
                            CustomButtomAuth(
                              text: "send".tr,
                              onPressed: () {
                                if (controller.offerInsName.isEmpty ) {
                                  Get.snackbar('Error'.tr, 'ErrorofferInsName'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }

                                else if (controller.offername.isEmpty ) {
                                  Get.snackbar('Error'.tr, 'Erroroffername'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }


                                else if ( controller.offeremail.isEmpty ) {
                                  Get.snackbar('Error'.tr, 'Errorofferemail1'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }
                                else if (isEmailValid(controller.offeremail)==false) {
                                  Get.snackbar('Error'.tr, 'Errorofferemail2'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }
                                else  if ( controller.offercardId.isEmpty && controller.offerPassport.isEmpty) {
                                  Get.snackbar('Error'.tr, 'ErroroffercardId'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }

                                else  if ( isEgyptianIDValid(controller.offercardId)  !="" && controller.offercardId.isNotEmpty) {
                                  Get.snackbar('Error'.tr, 'Errorcard'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }

                                else  if ( controller.offertel.isEmpty) {
                                  Get.snackbar('Error'.tr, 'Erroroffertel'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }
                                else if(validatePhoneNumber(controller.offertel!)!="")
                                {
                                  Get.snackbar(
                                      'error'.tr, validatePhoneNumber(controller.offertel),
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }
                                else  if ( controller.offersubject.isEmpty) {
                                  Get.snackbar('Error'.tr, 'Errorsubject'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }




                                else {
                                  controller.sendOfferPrice();
                                }
                              },
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(height: 20,),
                            CustomTextSignUpOrSignIn(
                              textone: "",
                              texttwo: "back".tr,
                              onTap: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()
                                    ));
                              },
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
    ) ),
          ),
        ),
              ),
      bottomNavigationBar: CustomBottomAppBar(
        mycontroller: mycontroller,
        servicecontroller: servicecontroller,
      ),
    );

  }
  bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  String isEgyptianIDValid(String value) {
    // Check if the ID is exactly 14 digits long and contains only digits
       // Check if all characters are digits
    final RegExp cardRegExp = RegExp(r'^(1|2|3)\d{13}$');
    if (!cardRegExp.hasMatch(value)) {
      return "Errorcard".tr;
    }
    return "";
  }

  String validatePhoneNumber(String value) {
    final RegExp phoneRegExp = RegExp(r'^(010|011|012|015)\d{8}$');
    if (value.isEmpty) {
      return ""; // No error if empty (optional to make it required)
    } else if (!phoneRegExp.hasMatch(value)) {
      return "telerror".tr;
    }
    return ""; // No error if valid
  }
}
