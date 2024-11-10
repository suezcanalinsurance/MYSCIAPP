 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/view/screen/AccidentReport.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/NewBranches.dart';
import 'package:suezproduction/view/screen/claimpage.dart';
import 'package:suezproduction/view/screen/contactus.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:suezproduction/view/screen/ourproducts.dart';
import 'package:suezproduction/view/screen/pol_pricing.dart';


 class EventsAndExperiences extends StatelessWidget {
   const EventsAndExperiences({Key? key}) : super(key: key);
   /*        Get.dialog(AlertDialog(
             title: Text('رسالة '),
             content: Text('        سوف يعرض في وقت قريب'),
             actions: <Widget>[
               TextButton(
                 child: Text('إغلاق'),
                 onPressed: () {
                   Get.back();
                 },
               ),
             ],
           ));*/
   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 16,right: 16),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: const [
             EventsAndExperiencesItems(
               newnumber:'1',
               title: 'تأمين السيارة',
               description: 'يمكنك الان الحصول علي عرض سعر لتأمين سياراتك وسنتواصل معك في أقرب وقت',
               lessonsCount: ' ',
               imagePath: 'assets/images/auo-2nn.png',

             ),
             EventsAndExperiencesItems(
               newnumber:'2',
               title: 'تأمين   الحوادث الشخصيه لمدربي الغوص والسنوركل',
               description: ' يمكنك الحصول علي عرض سعر لتأمين الحوادث الشخصيه لمدربي الغوص والسنوركل',
               lessonsCount: '',
               imagePath: 'assets/images/news22.png',

             ),
             /*    EventsAndExperiencesItems(
              newnumber:'3',
              title: 'وفر وقتك واشتري رحلتك',
              description: 'دلوقتي تقدر تسدد وثيقة التأمين الخاصة بيك بطريقة اسهل و اسرع .              من خلال موقعنا الالكتروني',
              lessonsCount: '13 Feb, Sunday',
              imagePath: 'assets/images/news2.jpg',
            ),*/

           ],
         ),
       ),
     );
   }
 }
 class EventsAndExperiencesItems extends StatelessWidget {

   const EventsAndExperiencesItems({
     Key? key, required this.newnumber, required this.title, required this.description, required this.lessonsCount, required this.imagePath,
   }) : super(key: key);
   final String newnumber;
   final String title;
   final String description;
   final String lessonsCount;
   final String imagePath;


   @override
   Widget build(BuildContext context) {
     ServiceController mycontroller = Get.put(ServiceController());
     return GestureDetector(
       onTap: () {

       },
       child: Container(
         margin: const EdgeInsets.only(right: 20,bottom: 20,left: 20),
         width: 240,
         height: 300,
         decoration: BoxDecoration(
             color: Colors.white,
             boxShadow: [BoxShadow(
                 color: Colors.grey.shade300,
                 blurRadius: 10
             )],
             borderRadius: BorderRadius.circular(15)
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(15),
                   topRight: Radius.circular(15)),
               child: Image.asset(
                 imagePath,
                 fit: BoxFit.cover,
                 height: 150,
               ),
             ),
             Expanded(
               child: Container(
                 padding: const EdgeInsets.all( 5),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     /*     Text(title,style: Theme.of(context).textTheme.bodyText2,),*/
                     Text(description,style: Theme.of(context).textTheme.bodyText1,),
                     /*    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lessonsCount,style: TextStyle(fontSize: 10),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue,width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                          ),
                          onPressed: (){
                            if(newnumber=="1")
                              {

                              }
                            else
                              {

                              }

                          },
                            child: const Text('تفاصيل الخبر'),
                        )

                      ],
                    )*/
                   ],
                 ),
               ),
             )
           ],
         ),
       ),
     );
   }
 }
/*





 class EventsAndExperiences2 extends StatelessWidget {
   const EventsAndExperiences2({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 16),
         child: Wrap(
           spacing: 20, // Horizontal spacing between items
           runSpacing: 20, // Vertical spacing between rows
           children: [
             EventsAndExperiencesItems2(
               newnumber: '1',
               title: "E_Pay".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/sadad.png',
             ),
             EventsAndExperiencesItems2(
               newnumber: '2',
               title: "claimtitle".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/taweed.png',
             ),
             EventsAndExperiencesItems2(
               newnumber: '3',
               title: "branches".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/location.gif',
             ),
             EventsAndExperiencesItems2(
               newnumber: '4',
               title: "Validate_document".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/verify.jpg',
             ),
           ],
         ),
       ),
     );
   }
 }




 class EventsAndExperiences3 extends StatelessWidget {
   const EventsAndExperiences3({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 16),
         child: Wrap(
           spacing: 20, // Horizontal spacing between items
           runSpacing: 20, // Vertical spacing between rows
           children: [
             EventsAndExperiencesItems2(
               newnumber: '4',
               title: "Validate_document".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/verify.png',
             ),
             EventsAndExperiencesItems2(
               newnumber: '3',
               title: "cat".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/products.jpg',
             ),

           ],
         ),
       ),
     );
   }
 }

 class EventsAndExperiences4 extends StatelessWidget {
   const EventsAndExperiences4({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 16),
         child: Wrap(
           spacing: 20, // Horizontal spacing between items
           runSpacing: 20, // Vertical spacing between rows
           children: [
             EventsAndExperiencesItems2(
               newnumber: '3',
               title: "branches".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/location.gif',
             ),
             EventsAndExperiencesItems2(
               newnumber: '4',
               title: "contact".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/call.png',
             ),


           ],
         ),
       ),
     );
   }
 }



 class EventsAndExperiencesItems2 extends StatelessWidget {
   const EventsAndExperiencesItems2({
     Key? key, required this.newnumber, required this.title, required this.description, required this.lessonsCount, required this.imagePath,
   }) : super(key: key);
   final String newnumber;
   final String title;
   final String description;
   final String lessonsCount;
   final String imagePath;


   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: () {
         if(newnumber=="1")
         {
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => PolpricingForm()));
         }
         else
         {

           Get.dialog(AlertDialog(
             title: Text('رسالة '),
             content: Text('        سوف يعرض في وقت قريب'),
             actions: <Widget>[
               TextButton(
                 child: Text('إغلاق'),
                 onPressed: () {
                   Get.back();
                 },
               ),
             ],
           ));
         }
       },
       child:  Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.white,
           boxShadow: [
             BoxShadow(
               color: Colors.grey.shade300,
               blurRadius: 10,
             )
           ],
           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(
               child: ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(15),
                   topRight: Radius.circular(15),
                 ),
                 child: Image.asset(
                   imagePath,
                   fit: BoxFit.cover,
                   height: 100,
                 ),
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )










/*



 Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.transparent, // Set the container to be transparent
           border: Border.all(
             color: const Color(0xff1696EE), // Set border color to 0xff1696EE
             width: 2, // Set border width
           ),

           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(15),
                 topRight: Radius.circular(15),
               ),
               child: Image.asset(
                 imagePath,
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )


Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.transparent,
           border: Border.all(
             color: const Color(0xff1696EE), // Set border color
             width: 2,
           ),
           boxShadow: [
             BoxShadow(
               color: Colors.grey.shade300,
               blurRadius: 10,
             ),
           ],
           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(15),
                 topRight: Radius.circular(15),
               ),
               child: Image.asset(
                 imagePath, // Replace with your GIF asset path
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )

Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.transparent,
           border: Border.all(
             color: const Color(0xff1696EE), // Set border color
             width: 2,
           ),
           boxShadow: [
             BoxShadow(
               color: Colors.grey.shade300,
               blurRadius: 10,
             ),
           ],
           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(15),
                 topRight: Radius.circular(15),
               ),
               child: Image.asset(
                 imagePath, // Replace with your GIF asset path
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )


*/
       ,
     );
   }
 }

 class EventsAndExperiencesItems5 extends StatelessWidget {
   const EventsAndExperiencesItems5({
     Key? key, required this.newnumber, required this.title, required this.description, required this.lessonsCount, required this.icon,
   }) : super(key: key);
   final String newnumber;
   final String title;
   final String description;
   final String lessonsCount;
   final IconData icon;


   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: () {
         if(newnumber=="1")
         {
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => PolpricingForm()));
         }
         else
         {

           Get.dialog(AlertDialog(
             title: Text('رسالة '),
             content: Text('        سوف يعرض في وقت قريب'),
             actions: <Widget>[
               TextButton(
                 child: Text('إغلاق'),
                 onPressed: () {
                   Get.back();
                 },
               ),
             ],
           ));
         }
       },
       child:Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 120,
         height: 100,
         decoration: BoxDecoration(
           color: Colors.transparent,
           border: Border.all(
             color: const Color(0xff1696EE), // Set border color
             width: 2,
           ),
           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(
               child: ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(15),
                 ),
                 child: Icon(
                   CupertinoIcons.umbrella_fill,
                   color: Colors.blue,
                   size: 60.0,
                 ),
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )




/*Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.transparent,
           border: Border.all(
             color: const Color(0xff1696EE), // Set border color
             width: 2,
           ),
           boxShadow: [
             BoxShadow(
               color: Colors.grey.shade300,
               blurRadius: 10,
             ),
           ],
           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(15),
                 topRight: Radius.circular(15),
               ),
               child: Image.asset(
                 imagePath, // Replace with your GIF asset path
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )








       Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.transparent, // Set the container to be transparent
           border: Border.all(
             color: const Color(0xff1696EE), // Set border color to 0xff1696EE
             width: 2, // Set border width
           ),

           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(15),
                 topRight: Radius.circular(15),
               ),
               child: Image.asset(
                 imagePath,
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )
       Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 150,
         decoration: BoxDecoration(
           color: Colors.white,
           boxShadow: [
             BoxShadow(
               color: Colors.grey.shade300,
               blurRadius: 10,
             )
           ],
           borderRadius: BorderRadius.circular(15),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(15),
                 topRight: Radius.circular(15),
               ),
               child: Image.asset(
                 imagePath,
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
             Center(
               child: Text(
                 title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.blue.shade900,
                 ),
               ),
             ),
           ],
         ),
       )*/
       ,
     );
   }
 }

*/

 class sci_service extends StatelessWidget {
   const sci_service({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 5,right: 5),
         child: Wrap(
           spacing: 10, // Horizontal spacing between items
           runSpacing: 5, // Vertical spacing between rows
           children: [
             SizedBox(
               width: 110,
             //  width: MediaQuery.of(context).size.width / 3 - 10, // 1/3 of screen width minus spacing
               child: EventsAndExperiencesItems6(
                 newnumber: '1',
                 title: "Validate_document".tr,
                 description: '',
                 lessonsCount: '',
                 imagePath: 'assets/images/verify.png',
                 gifPath: 'assets/images/verify.gif',
               ),
             ),
             SizedBox(
               width: 110,
               child: EventsAndExperiencesItems6(
                 newnumber: '2',
                 title: "claimtitle".tr,
                 description: '',
                 lessonsCount: '',
                 imagePath: 'assets/images/car.png',
                 gifPath: 'assets/images/car.gif',
               ),
             ),
             SizedBox(
               width: 110,
              // width: MediaQuery.of(context).size.width / 3 - 10,
               child: EventsAndExperiencesItems6(
                 newnumber: '3',
                 title: "E_Pay".tr,
                 description: '',
                 lessonsCount: '',
                 imagePath: 'assets/images/pay.png',
                 gifPath: 'assets/images/pay.gif',
               ),
             ),
           ],
         ),
       ),
     )
     ;
   }
 }

 class sci_service2 extends StatelessWidget {
   const sci_service2({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 5,right: 5),
         child: Wrap(
           spacing: 10, // Horizontal spacing between items
           runSpacing: 10, // Vertical spacing between rows
           children: [
             SizedBox(
               width: 110,
             //  width: MediaQuery.of(context).size.width / 3 - 10, // 1/3 of screen width minus spacing
               child: EventsAndExperiencesItems6(
                 newnumber: '7',
                 title: "anotheracciedent".tr,
                 description: '',
                 lessonsCount: '',
                 imagePath: 'assets/images/report.png',
                 gifPath: 'assets/images/report.gif',
               ),
             ),
             SizedBox(
               width: 110,
               //width: MediaQuery.of(context).size.width / 3 - 10,
               child: EventsAndExperiencesItems6(
                 newnumber: '5',
                 title: "cat".tr,
                 description: '',
                 lessonsCount: '',
                 imagePath: 'assets/images/products.png',
                 gifPath: 'assets/images/products.gif',
               ),
             ),
             SizedBox(
               width: 110,
              // width: MediaQuery.of(context).size.width / 3 - 10,
               child: EventsAndExperiencesItems6(
                 newnumber: '6',
                 title: "branches".tr,
                 description: '',
                 lessonsCount: '',
                 imagePath: 'assets/images/locations.png',
                 gifPath: 'assets/images/locations.gif',
               ),
             ),
           ],
         ),
       ),
     )
     ;
   }
 }


 class sci_service3 extends StatelessWidget {
   const sci_service3({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 5, right: 5),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start, // Aligns items to the right
           children: [
             Wrap(
               spacing: 10, // Horizontal spacing between items
               runSpacing: 10, // Vertical spacing between rows
               children: [
                 SizedBox(
                   width: MediaQuery.of(context).size.width / 3 - 10, // 1/3 of screen width minus spacing
                   child: EventsAndExperiencesItems6(
                     newnumber: '4',
                     title: "contact".tr,
                     description: '',
                     lessonsCount: '',
                     imagePath: 'assets/images/call.png',
                     gifPath: 'assets/images/call.gif',
                   ),
                 ),
               ],
             ),
           ],
         ),
       )
       ,
     )
     ;
   }
 }

 class EventsAndExperiencesItems6 extends StatefulWidget {
   const EventsAndExperiencesItems6({
     Key? key,
     required this.newnumber,
     required this.title,
     required this.description,
     required this.lessonsCount,
     required this.imagePath,
     required this.gifPath, // Add a new gifPath parameter
   }) : super(key: key);

   final String newnumber;
   final String title;
   final String description;
   final String lessonsCount;
   final String imagePath;
   final String gifPath; // Path to the GIF image

   @override
   _EventsAndExperiencesItems6State createState() => _EventsAndExperiencesItems6State();
 }

 class _EventsAndExperiencesItems6State extends State<EventsAndExperiencesItems6> {
   late String currentImagePath;

   @override
   void initState() {
     super.initState();
     currentImagePath = widget.imagePath; // Set the initial image path
   }

   @override
   Widget build(BuildContext context) {
     final snackBar = SnackBar(
       content: Text("loginfirst".tr), // Assuming 'loginfirst' is defined in your translations
     );
     ServiceController mycontroller = Get.put(ServiceController());
     return GestureDetector(
       onTapDown: (_) {
         setState(() {
           currentImagePath = widget.gifPath; // Change to GIF when finger touches
         });
       },
       onTapUp: (_) {
         setState(() {
           currentImagePath = widget.imagePath; // Revert to original image when finger is lifted
         });
       },
       onTapCancel: () {
         setState(() {
           currentImagePath = widget.imagePath; // Revert if the tap is canceled
         });
       },
       onTap: () {
         if(widget.newnumber=="1")
         {
           if (mycontroller.isLogin() == false) {


             ScaffoldMessenger.of(context)
                 .showSnackBar(snackBar);
           } else {
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => CheckPolicy()));
             //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
           }
         }
         else if(widget.newnumber=="2")
           {
             if (mycontroller.isLogin() == false) {


               ScaffoldMessenger.of(context)
                   .showSnackBar(snackBar);
             } else {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => claimpage()));
               //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
             }
           }
         else if(widget.newnumber=="3")
         {
           if (mycontroller.isLogin() == false) {


             ScaffoldMessenger.of(context)
                 .showSnackBar(snackBar);
           } else {
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => OnLinepay()));
             //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
           }
         }
         else if(widget.newnumber=="4")
         {

             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => contactus()));
             //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');

         }
         else if(widget.newnumber=="5")
         {

           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => ourproduct()));
           //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');

         }
         else if(widget.newnumber=="6")
         {

           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => NewBranches()));
           //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');

         }
         else if(widget.newnumber=="7")
         {
         if (mycontroller.isLogin() == false) {


         ScaffoldMessenger.of(context)
             .showSnackBar(snackBar);
         } else {
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => AccidentReportForm()));
           //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
         }
         }
         else
         {


         }
       },
       child: Container(
         margin: const EdgeInsets.only(right: 1, bottom: 10, top: 10),
         width: 100,
         height: 80,
         decoration: BoxDecoration(
           color:  ((widget.newnumber=="1"  || widget.newnumber=="2"  || widget.newnumber=="3" || widget.newnumber=="7" ) && mycontroller.isLogin() == false) ? Colors.grey.shade300 :Colors.white ,
           boxShadow: [
             BoxShadow(
               color: Colors.grey.shade300,
               blurRadius: 10,
             )
           ],

           borderRadius: BorderRadius.circular(15),

           border: Border.all( // إضافة الحد الأزرق
             color:((widget.newnumber=="1"  || widget.newnumber=="2"  || widget.newnumber=="3" || widget.newnumber=="7" ) && mycontroller.isLogin() == false)? Colors.blue: Colors.white, // لون الحد
             width: 2, // عرض الحد
           ),
         ),
         child: Center( // Ensure the content is centered in the container
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
             crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
             children: [
               Image.asset(
                 currentImagePath,
                 fit: BoxFit.cover,
                 height: 40,
                 width: 40, // You can set the width for a consistent size
               ),
               const SizedBox(height: 5), // Add space between image and text
               Text(
                 widget.title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 10.0, // Set your desired font size here
                   color: AppColor.SCIsecondaryColor,
                 ),
               ),
             ],
           ),
         ),
       ),
     )
     ;
   }
 }


 /*
 class EventsAndExperiences66_trans extends StatelessWidget {
   const EventsAndExperiences66_trans({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Container(
         padding: EdgeInsets.only(left: 16),
         child: Wrap(
           spacing: 20, // Horizontal spacing between items
           runSpacing: 20, // Vertical spacing between rows
           children: [
             EventsAndExperiencesItems6_trans(
               newnumber: '1',
               title: "E_Pay".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/car.png',
               gifPath: 'assets/images/car.gif',
             ),
             EventsAndExperiencesItems6_trans(
               newnumber: '1',
               title: "branches".tr,
               description: '',
               lessonsCount: '',
               imagePath: 'assets/images/locations.png',
               gifPath: 'assets/images/location.gif',
             ),
           ],
         ),
       ),
     );
   }
 }





 class EventsAndExperiencesItems6_trans extends StatefulWidget {
   const EventsAndExperiencesItems6_trans({
     Key? key,
     required this.newnumber,
     required this.title,
     required this.description,
     required this.lessonsCount,
     required this.imagePath,
     required this.gifPath, // Add a new gifPath parameter
   }) : super(key: key);

   final String newnumber;
   final String title;
   final String description;
   final String lessonsCount;
   final String imagePath;
   final String gifPath; // Path to the GIF image

   @override
   _EventsAndExperiencesItems6State_trans createState() => _EventsAndExperiencesItems6State_trans();
 }

 class _EventsAndExperiencesItems6State_trans extends State<EventsAndExperiencesItems6_trans> {
   late String currentImagePath;

   @override
   void initState() {
     super.initState();
     currentImagePath = widget.imagePath; // Set the initial image path
   }

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTapDown: (_) {
         setState(() {
           currentImagePath = widget.gifPath; // Change to GIF when finger touches
         });
       },
       onTapUp: (_) {
         setState(() {
           currentImagePath = widget.imagePath; // Revert to original image when finger is lifted
         });
       },
       onTapCancel: () {
         setState(() {
           currentImagePath = widget.imagePath; // Revert if the tap is canceled
         });
       },
       onTap: () {
         if (widget.newnumber == "1") {
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => PolpricingForm()),
           );
         } else {
           Get.dialog(AlertDialog(
             title: Text('رسالة '),
             content: Text('سوف يعرض في وقت قريب'),
             actions: <Widget>[
               TextButton(
                 child: Text('إغلاق'),
                 onPressed: () {
                   Get.back();
                 },
               ),
             ],
           ));
         }
       },
       child: Container(
         margin: const EdgeInsets.only(right: 20, bottom: 20),
         width: 160,
         height: 100,
         decoration:BoxDecoration(
             color: Colors.transparent, // Set the container to be transparent
             border: Border.all(
               color: const Color(0xff1696EE), // Set border color to 0xff1696EE
               width: 2,
               // Set border width
             ) ,  borderRadius: const BorderRadius.only(
         topLeft: Radius.circular(15),
         topRight: Radius.circular(15),
       ),),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(
               child: ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(15),
                   topRight: Radius.circular(15),
                 ),
                 child: Image.asset(
                   currentImagePath,
                   fit: BoxFit.cover,
                   height: 50,
                 ),
               ),
             ),
             Center(
               child: Text(
                 widget.title,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 14.0, // Set your desired font size here
                   fontWeight: FontWeight.bold,
                   color: Colors.black54,
                 ),
               ),
             ),
           ],
         ),
       ),

     );
   }
 }
 */
