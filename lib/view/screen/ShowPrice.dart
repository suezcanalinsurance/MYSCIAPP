import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:suezproduction/controller/ShowPriceController.dart';
import 'package:suezproduction/view/screen/Home.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/screen/pol_pricing.dart';




class showprice extends StatelessWidget {

  ShowPriceControllerImp controller= Get.put(ShowPriceControllerImp());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عرض سعر تأمين سيارتك'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  PinchZoom(
                    child: Image.asset('assets/images/auo-2nn.png',width: 150,height: 150,),
                    maxScale: 6.5,
                    onZoomStart: (){

                    },
                    onZoomEnd: (){

                    },
                  ),
                  Text("'عرض سعر تأمين سيارتك هو ${controller.price} جنيه'"
                   ,  textAlign: TextAlign.center,
                      style: TextStyle(

                          fontSize: 20
                             ,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900)
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            SizedBox(height: 20),
            InkWell(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.blue,
                  ),
                  title:Text(
                    "back".tr,
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],
    );

  }
}
