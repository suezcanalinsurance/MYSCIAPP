import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/AccidentReportController.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';


class AccidentReportForm extends StatelessWidget {
  final AccidentReportController controller = Get.put(AccidentReportController());
  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp  logincontroller= Get.put(LoginControllerImp());

  @override

  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();
    final List<Map<String, String>> emailList = [
      {'name': 'تعويضات الحوادث','name_en':'Miscellaneous claims', 'email': 'accclaim@sci-egypt.com'},
      {'name': 'تعويضات السيارات','name_en':'Motors claims', 'email': 'claim.motors@sci-egypt.net'},
      {'name': 'تعويضات الحريق','name_en':'Fire & burglary claims', 'email': 'fireclaim@sci-egypt.com'},
      {'name': 'تعويضات الهندسي','name_en':'Engineering claims', 'email': 'eng_claim@sci-egypt.com'},
      {'name': 'تعويضات أجسام السفن','name_en':'Marine Hull claims', 'email': 'hullclaim@sci-egypt.com'},
      {'name': 'تعويضات   البحري','name_en':'Marine cargo claims', 'email': 'cargo_claims@sci-egypt.com'},
    //  {'name': 'العزب', 'email': 'elazab@sci-egypt.net'},
      // Add more names and emails as needed
    ];
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
    child:  GetBuilder<AccidentReportController>(
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
                  SizedBox(height: 20),
                  CustomTextTitleAuth(text: "acciedent".tr),
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
                                    controller.acciedentname = '';
                                    // controller.acciedenttel = '';
                                    controller.acciedentpolNo = '';
                                    controller.acciedentsubject = '';
                                  },
                                  child: Text('anotheracciedent'.tr),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: [
                            DropdownButtonFormField<Map<String, String>>(
                              decoration: InputDecoration(labelText: 'edara'.tr),
                              items: emailList.map((item) {
                                return DropdownMenuItem<Map<String, String>>(
                                  value: item,
                                  child: Text('${translateDatabase(item['name'],item['name_en'])}'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.emailto = value['email'] ?? '';
                                }
                              },
                            ),
                      TextField(
                              decoration: InputDecoration(labelText: "name".tr),
                              controller: TextEditingController(text: controller.acciedentname),
                              onChanged: controller.onNameChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "18".tr),
                              controller: TextEditingController(text: controller.acciedentemail),
                              onChanged: controller.onEmailChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "21".tr,

                              ),
                              keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // يسمح فقط بالأرقام
                                LengthLimitingTextInputFormatter(11),
                              ],
                              controller: TextEditingController(text: controller.acciedenttel),
                                onChanged:controller.onTelChanged
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "polNo".tr),
                              controller: TextEditingController(text: controller.acciedentpolNo),
                              onChanged: controller.onPolNoChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "acciedentsubject".tr,
                                alignLabelWithHint: true,
                              ),
                              onChanged: (value) => controller.acciedentsubject = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              minLines: 5,
                            ),
                            SizedBox(height: 20),
                            CustomButtomAuth(
                              text: "send".tr,
                              onPressed: () {
                                if (controller.emailto.isEmpty ) {
                                  Get.snackbar('Error'.tr, 'ErrorofferInsName'.tr, backgroundColor: Colors.red, colorText: Colors.white);
                                }
                               else if (controller.acciedentname.isEmpty ) {
                                  Get.snackbar(
                                      'error'.tr, "Erroroffername".tr,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }
                                else  if ( controller.acciedentemail.isEmpty) {
                                  Get.snackbar(
                                      'error'.tr, "Errorofferemail1".tr,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }
                                else if(validatePhoneNumber(controller.acciedenttel!)!="")
                                {
                                  Get.snackbar(
                                      'error'.tr, validatePhoneNumber(controller.acciedenttel),
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }
                                else if ( controller.acciedentsubject.isEmpty) {
                                  Get.snackbar(
                                      'error'.tr, 'Errorsubject'.tr,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }


                                else
                                 {
                                  controller.sendAccidentReport();
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
    )  ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        mycontroller: mycontroller,
        servicecontroller: servicecontroller,
      ),
    );

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
  bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }
}
