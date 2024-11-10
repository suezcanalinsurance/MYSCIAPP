import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';


 abstract class MapSamplecontroller extends GetxController{

}

class MapSamplecontrollerTmp extends MapSamplecontroller
{
  MyServices myServices=Get.find();
  double  lnd=0,lat=0; String branchName="";


  late CameraPosition kGooglePlex;
  late CameraPosition kLake;


      Set<Marker> markers = Set();





  void _onMarkerTapped(LatLng position) async {
    // Fetch place details using Google Places API
    List<Placemark> placemarkers =
    await placemarkFromCoordinates(lat, lnd);
    placemarkers[0].country;
    placemarkers[0].street;
    placemarkers[0].postalCode;
    placemarkers[0].administrativeArea;
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 16.0),
              Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 60,
                  ),
                  Text(branchName,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900)),
                  Text(placemarkers[0].street.toString(),style: TextStyle(

                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900)),
                  Row(
                    children: [
                      Text(" الرقم البريدي ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900)),
                      Text(placemarkers[0].postalCode.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900)),
                    ],
                  )/*,
                  Text(placemarkers[0].administrativeArea.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900))*/
                ],
              ),
              // يمكنك إضافة عناصر واجهة مستخدم أخرى هنا
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('إغلاق'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  initialData()
  {
    markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(lat , lnd ),
        onTap: () {
          // Handle marker tap
          _onMarkerTapped(LatLng(lat, lnd ));
        }));
    update();

  }


  void onInit()
  {
    branchName=Get.arguments["branchName"];
    lat=double.parse(Get.arguments["lat"]);
    lnd=double.parse(Get.arguments["lnd"]);

    print(lat);
     kGooglePlex = CameraPosition(
      target: LatLng(lat , lnd ),
      zoom: 14.4746,
    );

      kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat , lnd ),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    initialData();

    super.onInit();
  }


}
