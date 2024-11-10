import 'package:suezproduction/controller/CheckPolicyResultController.dart';
import 'package:suezproduction/controller/CheckPolicy_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/core/functions/validinput.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/data/model/policyInfo.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/customescaffoldAppbar.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:suezproduction/view/widget/home/Services.dart';
import 'package:suezproduction/view/widget/home/Services2.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';
import 'package:suezproduction/view/widget/home/customcardhome.dart';
import 'package:suezproduction/view/widget/customeappbar.dart';
import 'package:suezproduction/view/widget/home/customtitlehome.dart';
import 'package:suezproduction/view/widget/home/events_and_experiences.dart';
import 'package:suezproduction/view/widget/home/listcategorieshome.dart';
import 'package:suezproduction/view/widget/home/listitemshome.dart';
import 'package:suezproduction/view/widget/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';



class CheckPolicy_Result extends StatelessWidget {
  const CheckPolicy_Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckPolicyResultControllerImp());
    CheckPolicyResultControllerImp controller=new CheckPolicyResultControllerImp();
    HomecontrollerTmp mycontroller=  Get.put(HomecontrollerTmp());
    policyInfoModel policyInfo_model  =policyInfoModel.fromJson(controller.data[0]);
    return    Scaffold(
        drawer: NavDrawer(),

        appBar:    appBottomView(gotoroot: AppRoute.home,myargument: {},),

        body:  WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<CheckPolicyControllerImp>(builder:
              (controller)=>
          controller.statusRequest==StatusRequest.loading?
          Center(child:const Text("loading..."),) :
          controller.statusRequest==StatusRequest.offlinefailure?
          Center(child:const Text("No Internet Connection ..."),)
              : Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(children: [
                CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(0), // Border radius
                      child: ClipOval(
                        child: Image.asset(
                          AppImageAsset.producers,
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "التحقق من صحة الوثيقة"),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "يمكنك التحقق من صحة الوثيقة الخاصة بكم عن طريق كتابة رقم الوثيقة والأستيكر."),
                const SizedBox(height: 15),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    InkWell(
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            title: Text(
                             policyInfo_model.polNo!,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 20,
                                  color: Colors.blue.shade900),
                            ),
                          ),

                        ),
                        onTap: (){
                          //  _launchURL('tel:16569');
                          FlutterPhoneDirectCaller.callNumber('16596');


                        }
                    ),
                    InkWell(
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          title:Text(
                            ' info@sci-egypt.com',
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                                color: Colors.blue.shade900),
                          ),
                        ),
                      ),
                      onTap: (){
                        //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');

                      },
                    ),
                    InkWell(
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.location_pin,
                              color: Colors.blue,
                            ),
                            title: Text(
                              '31 شارع محمد كامل مرسي –  البطل احمد عبد العزيز - المهندسين – الجيزة.',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 20,
                                  color: Colors.blue.shade900),
                            ),
                          ),

                        ),
                        onTap: (){
                          //  _launchURL('tel:16569');
                        }
                    ),

                  ],
                ),
           /*
                      print(policyInfo_model.polNo);*/



                const SizedBox(height: 40),
                CustomTextSignUpOrSignIn(
                  textone: "",
                  texttwo: "رجوع",
                  onTap: () {
                    controller.goToHome();
                  },
                ),
              ]),

          ))

          ,) ) ; }


}

