import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';

class appBottomView extends StatelessWidget implements PreferredSizeWidget {
  @override
  final String gotoroot;
  final Map<String, dynamic> myargument;


  const appBottomView({Key? key, required this.gotoroot, required this.myargument}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {

    LocaleController localcontroller = Get.put(LocaleController());
    MyServices myservice=Get.find();
    return AppBar(

      iconTheme: IconThemeData(color: Colors.white),

      backgroundColor: Colors.blue.shade900,
      centerTitle: true,
      title: Text(''),
      /*Text(
        'حصن أمان للملايين',
        style:
        TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
      )*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: new Icon(Icons.subject),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      /*InkWell(

        child: Icon(
          Icons.subject,
          color: Colors.white,
        ),
      )*/
      actions: [
        Container(
          padding:myservice.sharedPreferences.getString("lang")=="en"? EdgeInsets.only(right: 30,top: 3):EdgeInsets.only(left: 30,top: 3),
          child: InkWell(child: Icon(Icons.language,color: Colors.white,),onTap: (){
            final double screenWidth = MediaQuery.of(context).size.width;

            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        ListTile(
                            leading: ClipOval(

                              child: Image.asset(

                                AppImageAsset.en,width: 20,
                              ),
                            ),
                            title: Text("English (إنجليزي)",  style: TextStyle(
                              fontSize: screenWidth * 0.05,

                            )),
                            onTap: () =>
                            {
                              localcontroller.changeLang("en")
                            }
                        ),
                        ListTile(
                            leading: ClipOval(

                              child: Image.asset(

                                AppImageAsset.ar,width: 20,
                              ),
                            ),
                            title: Text("Arabic  (عربي)",  style: TextStyle(
                             fontSize: screenWidth * 0.05,

                            )),
                            onTap: () =>
                            {
                              localcontroller.changeLang("ar")
                            }
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },),
        ),

      ],
      bottom: PreferredSize(
          child: getAppBottomView(context),
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.02)),
    );
  }


  Widget getAppBottomView(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(

        padding: EdgeInsets.only(left: 30, bottom: 20),
      child: Row(
        children: [
          getProfileView(),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "suez".tr,
                      style:   TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
                         ),


                  ],

                ),
          /*      Text(
                  'sci@sci-egypt.com',
                  style:  TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
                ),
                Text(
                  '16569',
                  style:  TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
                ),*/
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getProfileView() {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:  CircleAvatar(
                radius: 36,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(0), // Border radius
                  child: ClipOval(
                    child: Image.asset(
                      AppImageAsset.logo,
                    ),
                  ),
                )),
          ),
        ),
    /*
    Positioned(
    bottom: 1,
    right: 1,
    child: Container(
    height: 30,
    width: 30,
    child: Icon(
    Icons.edit,
    color: Colors.deepPurple,
    size: 20,
    ),
    decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.all(Radius.circular(20))),
    ))*/
    ],
    );
  }



}
