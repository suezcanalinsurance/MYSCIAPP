import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return    Container(
     color: Colors.blue.shade50,
     padding: const EdgeInsets.all(10.0),
     child: GridView.builder(
       physics: PageScrollPhysics(),

       shrinkWrap: true,
       gridDelegate:
       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       itemBuilder: (context, position) {
         return Padding(

             padding: const EdgeInsets.all(2.0),
             child: InkWell(
                 onTap: () {},
                 child: Center(

                   child: Column(
                     children: [
                       Center(
                         child: Card(
                           shape: RoundedRectangleBorder(

                               borderRadius: BorderRadius.circular(100.0)),
                           elevation: 5,
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child:  menuList[position].image,
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Container(
                           alignment: Alignment.bottomCenter,
                           child: Text(
                             menuList[position].title,
                             textAlign: TextAlign.center,
                             style: TextStyle( fontFamily: 'Heavy',
                                 fontSize: 14,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.blue.shade900),
                           ),
                         ),
                       )
                     ],
                   ),
                 )));
       },
       itemCount: menuList.length,
     ),

    );
  }
 
}

/*, Icon(
                               menuList[position].icon,
                               size: 50,
                               color: AppColor.primaryColor,
                             )*/