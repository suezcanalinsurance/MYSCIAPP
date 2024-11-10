import 'package:get/get.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:url_launcher/url_launcher.dart';
class customappbar extends StatelessWidget {
  final String titleapp;
  final void Function()  onPressedicon;
  final void Function()  onPressedsearch;
  const customappbar({Key? key,required this.titleapp,required this.onPressedicon, required this.onPressedsearch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
    final double imageSize = 230.0; // يمكنك تعديل هذا الحجم حسب الحاجة
    final double imageSizeW = 350.0;


    return ClipRRect(
        borderRadius: BorderRadius.circular(20), // Set border radius for the slideshow
        child:ImageSlideshow(
      width: imageSizeW,
      height: imageSize,
      initialPage: 0,

      children: [
        GestureDetector(
          onTap: () async {
    /*        // روابط المتاجر لتنزيل تطبيق MyFawry
            const appStoreLink = 'https://apps.apple.com/eg/app/myfawry/id1462911630'; // رابط iOS
            const playStoreLink = 'https://play.google.com/store/apps/details?id=com.fawry.myfawry'; // رابط Android

            try {
              // التوجيه إلى المتجر المناسب بناءً على نظام التشغيل
              if (Theme.of(context).platform == TargetPlatform.iOS) {
                await launchUrl(Uri.parse(appStoreLink));
              } else {
                await launchUrl(Uri.parse(playStoreLink));
              }
            } catch (e) {
              print('Error opening app store link: $e');
            }*/
          },
          child:   Container(
          width: imageSizeW,
          height: imageSize,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // حواف دائرية
          boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.6), // ظل بلون برتقالي
          spreadRadius: 2, // انتشار الظل
          blurRadius: 5, // ضبابية الظل
          offset: Offset(0, 3), // اتجاه الظل
          ),
          ],
          ),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // حواف دائرية للصورة
          child: Image.asset(
            translateDatabase(AppImageAsset.slidshow7, AppImageAsset.slidshow7),
          fit: BoxFit.cover, // ملء الحاوية بالكامل
          ),
          ),
          )),

        Container(
          width: imageSizeW,
          height: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // حواف دائرية
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6), // ظل بلون برتقالي
                spreadRadius: 2, // انتشار الظل
                blurRadius: 5, // ضبابية الظل
                offset: Offset(0, 3), // اتجاه الظل
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // حواف دائرية للصورة
            child: Image.asset(
              translateDatabase(AppImageAsset.slidshow_en6, AppImageAsset.slidshow_en6),
              fit: BoxFit.cover, // ملء الحاوية بالكامل
            ),
          ),
        ),
        Container(
          width: imageSizeW,
          height: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // حواف دائرية
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6), // ظل بلون برتقالي
                spreadRadius: 2, // انتشار الظل
                blurRadius: 5, // ضبابية الظل
                offset: Offset(0, 3), // اتجاه الظل
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // حواف دائرية للصورة
            child: Image.asset(
              AppImageAsset.slidshow5,
              fit: BoxFit.cover, // ملء الحاوية بالكامل
            ),
          ),
        ),
    GestureDetector(
    onTap: () async {

            const appStoreLink = 'https://news.ambest.com/PR/PressContent.aspx?refnum=34040&altsrc=9#:~:text=AM%20Best%20has%20affirmed%20the,Ratings%20(ratings)%20is%20negative'; // رابط iOS



                await launchUrl(Uri.parse(appStoreLink));

    },
    child: Container(
          width: imageSizeW,
          height: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // حواف دائرية
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6), // ظل بلون برتقالي
                spreadRadius: 2, // انتشار الظل
                blurRadius: 5, // ضبابية الظل
                offset: Offset(0, 3), // اتجاه الظل
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // حواف دائرية للصورة
            child: Image.asset(
              AppImageAsset.slidshow8,
              fit: BoxFit.cover, // ملء الحاوية بالكامل
            ),
          ),
    )  )
      ],
      onPageChanged: (value) {},
      autoPlayInterval: 4000,
      isLoop: true,
    ));
  }

}
