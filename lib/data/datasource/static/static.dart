import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/data/model/carBrand.dart';
import 'package:suezproduction/data/model/onboardingmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:suezproduction/data/model/SeveiceModel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "2".tr, body: "3".tr, image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "4".tr, body: "5".tr, image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "6".tr, body: "7".tr, image: AppImageAsset.onBoardingImageThree),

];

List menuList = [
  MenuItemModel(Image.asset('assets/images/producers.png', width: 50,    height: 50,), 'التأكد من صحة الوثيقة'),

  MenuItemModel(Image.asset('assets/images/request.png', width: 50,    height: 50,), 'طلب تأمين'),
  MenuItemModel(Image.asset('assets/images/22.png', width: 50,    height: 50,),'سداد الوثيقة اون لاين'),

  MenuItemModel(Image.asset('assets/images/supportIcon.png', width: 50,    height: 50,), 'إتصل بنا'),
];

final List<Map<String, String>> InsList = [
{'InsKind': 'Ac','InsName': ' الحوادث','InsName_en':'Miscellaneous ', 'email': 'g.accidents@sci-egypt.com'},
{'InsKind': '31A','InsName': ' السيارات','InsName_en':'Motors ', 'email': 'claim.motors@sci-egypt.net'},
{'InsKind': 'Fr','InsName': 'الحريق','InsName_en':'Fire & burglary ', 'email': 'fire@sci-egypt.com'},
{'InsKind': '80','InsName': ' الهندسي','InsName_en':'Engineering ', 'email': 'eng@sci-egypt.com'},
{'InsKind': 'Hu','InsName': ' أجسام السفن','InsName_en':'Marine Hull ', 'email': 'hull@sci-egypt.com'},
{'InsKind': 'Ca','InsName': 'البحري','InsName_en':'Marine cargo ', 'email': 'cargo@sci-egypt.com'},
  {'InsKind': 'Do','InsName': ' الطبي','InsName_en':'Medical ', 'email': 'cargo@sci-egypt.com'},
];

/*
final List<Map<String, String>> InsList = [
  {'InsKind': '11', 'InsName': 'حريق'},
  {'InsKind': '12', 'InsName': 'سطو'},
  {'InsKind': '31A', 'InsName': 'سيارات تجارى'},
  {'InsKind': '31B', 'InsName': 'سيارات خصوصى'},
  {'InsKind': '32', 'InsName': 'سيارات إجبارى'},
  {'InsKind': '41', 'InsName': 'نقل بحري'},
  {'InsKind': '42', 'InsName': 'نقل داخلى'},
  {'InsKind': '51', 'InsName': 'وحدات بحرية'},
  {'InsKind': '60', 'InsName': 'حوادث'},
  {'InsKind': '61', 'InsName': 'حوادث شخصية'},
  {'InsKind': '62', 'InsName': 'مسئولية مدنية'},
  {'InsKind': '621', 'InsName': 'عائمات'},

  {'InsKind': '63', 'InsName': 'نقل نقدية'},
  {'InsKind': '64', 'InsName': 'أختلاس'},


  {'InsKind': '65', 'InsName': 'كسر زجاج'},
  {'InsKind': '66', 'InsName': 'حماية أسرة'},
  {'InsKind': '67', 'InsName': 'جميع أخطار نفوق الماشية'},
  {'InsKind': '68', 'InsName': 'مساعدات السفر'},

  {'InsKind': '80', 'InsName': 'هندسى'},
  {'InsKind': '801', 'InsName': 'مسئولية مدنية هندسي'},
  {'InsKind': '802', 'InsName': 'مسئوليةأخطاءالمهنة هندسي'},
  {'InsKind': '803', 'InsName': 'مسئولية المنتجات هندسي'},
  {'InsKind': '804', 'InsName': 'جميع أخطارالبنوك هندسي'},
  {'InsKind': '805', 'InsName': 'حوادث شخصية هندسي'},
  {'InsKind': '806', 'InsName': 'جميع الأخطارهندسي'},
  {'InsKind': '807', 'InsName': 'وثيقة أعمال مدنية متكاملة'},
  {'InsKind': '81', 'InsName': 'ألات ومعدات'},
  {'InsKind': '82', 'InsName': 'أخطار المقاولون'},
  {'InsKind': '83', 'InsName': 'أخطار التركيب'},
  {'InsKind': '84', 'InsName': 'أعطال الماكينات'},
  {'InsKind': '85', 'InsName': 'فقد أرباح'},
  {'InsKind': '86', 'InsName': 'فساد المخزون'},
  {'InsKind': '87', 'InsName': 'أجهزة إلكترونية'},
  {'InsKind': '91', 'InsName': 'تأمين صحى'},
  {'InsKind': '92', 'InsName': 'م.م.عشرية'},
  {'InsKind': '111', 'InsName': 'حريق شامل'},
  {'InsKind': '112', 'InsName': 'الشغب والاضطرابات'},
  {'InsKind': '69', 'InsName': 'الحوادث الشخصية للمقترضين'},
  {'InsKind': '89', 'InsName': 'العنف السياسي'},
  {'InsKind': '611', 'InsName': 'ضمان عدم سداد'},

  {'InsKind': '93', 'InsName': 'تأمين البترول'},
  {'InsKind': '612', 'InsName': 'حوادث اشخصية غوص وسنوركل'},

];
*/
List<CarBrand> carBrands = <CarBrand>[
  CarBrand(brandMain: 33,
      brandSub: 7,
      brandName:  "شيفورلية",
      brandSubName:  "جامبو 8000 عادة شكل جديد",
      fullBrandName : "شيفورلية جامبو 8000 عادة شكل جديد",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 7,
      brandName: "شيفورلية",
      brandSubName: "جامبو 7000 تكييف شكل جديد",
      fullBrandName: "شيفورلية جامبو 7000 تكييف شكل جديد",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 7,
      brandName: "شيفورلية",
      brandSubName: "جامبو 5200",
      fullBrandName: "شيفورلية جامبو 5200",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 7,
      brandName: "شيفورلية",
      brandSubName: "جامبو 7000 عادة شكل قديم",
      fullBrandName: "شيفورلية جامبو 7000 عادة شكل قديم",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 7,
      brandName: "شيفورلية",
      brandSubName: "جامبو 8000 عادة شكل قديم",
      fullBrandName: "شيفورلية جامبو 8000 عادة شكل قديم",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 31,
      brandName: "شيفورلية",
      brandSubName: "N300 عادة",
      fullBrandName: "شيفورلية N300 عادة",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 31,
      brandName: "شيفورلية",
      brandSubName: "N300 كاملة",
      fullBrandName: "شيفورلية N300 كاملة",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 33,
      brandSub: 60,
      brandName: "شيفورلية",
      brandSubName: "شيفروليه ماليبو",
      fullBrandName: "شيفورلية شيفروليه ماليبو",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 1,
      brandName: "شيفورلية",
      brandSubName: "افيو",
      fullBrandName: "شيفورلية افيو",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 33,
      brandSub: 2,
      brandName: "شيفورلية",
      brandSubName: "اوبترا",
      fullBrandName: "شيفورلية اوبترا",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 33,
      brandSub: 27,
      brandName: "شيفورلية",
      brandSubName: "كابتيفا",
      fullBrandName: "شيفورلية كابتيفا",

      countryOfOrigin: "9"),






  CarBrand(brandMain: 33,
      brandSub: 24,
      brandName: "شيفورلية",
      brandSubName: "لانوس",
      fullBrandName: "شيفورلية لانوس",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 28,
      brandName: "كيا",
      brandSubName: "سبورتاج",
      fullBrandName: "كيا سبورتاج",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 40,
      brandSub: 28,
      brandName: "كيا",
      brandSubName: "سبورتاج",
      fullBrandName: "كيا سبورتاج",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 28,
      brandName: "كيا",
      brandSubName: "سبورتاج",
      fullBrandName: "كيا سبورتاج",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 32,
      brandName: "كيا",
      brandSubName: "سبورتاج\r\nNQ5",
      fullBrandName: "كيا سبورتاج\r\nNQ5",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 33,
      brandName: "كيا",
      brandSubName: "سبورتاج\r\nNQ6",
      fullBrandName: "كيا سبورتاج\r\nNQ6",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 34,
      brandName: "كيا",
      brandSubName: "سبورتاج\r\nNQ7",
      fullBrandName: "كيا سبورتاج\r\nNQ7",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 35,
      brandName: "كيا",
      brandSubName: "سبورتاج\r\nNQ8",
      fullBrandName: "كيا سبورتاج\r\nNQ8",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 36,
      brandName: "كيا",
      brandSubName: "سبورتاج\r\nNQ9",
      fullBrandName: "كيا سبورتاج\r\nNQ9",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 40,
      brandSub: 21,
      brandName: "كيا",
      brandSubName: "سورنتو",
      fullBrandName: "كيا سورنتو",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 40,
      brandSub: 4,
      brandName: "كيا",
      brandSubName: "سيراتو",
      fullBrandName: "كيا سيراتو",
      countryOfOrigin: "9"),






  CarBrand(brandMain: 40,
      brandSub: 30,
      brandName: "كيا",
      brandSubName: "اكسيد",
      fullBrandName: "كيا اكسيد",
      countryOfOrigin: "9"),


  CarBrand(brandMain: 37,
      brandSub: 1,
      brandName: "فولكس",
      brandSubName: "باسات",
      fullBrandName: "فولكس باسات",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 37,
      brandSub: 19,
      brandName: "فولكس",
      brandSubName: "تيجوان",
      fullBrandName: "فولكس تيجوان",
      countryOfOrigin: "9"),





  CarBrand(brandMain: 37,
      brandSub: 6,
      brandName: "فولكس",
      brandSubName: "جولف",
      fullBrandName: "فولكس جولف",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 37,
      brandSub: 33,
      brandName: "فولكس",
      brandSubName: "تى روك",
      fullBrandName: "فولكس تى روك",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 1,
      brandSub: 30,
      brandName: "BMW",
      brandSubName: "118i",
      fullBrandName: "BMW 118i",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 39,
      brandName: "BMW",
      brandSubName: "218i",
      fullBrandName: "BMW 218i",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 1,
      brandSub: 41,
      brandName: "BMW",
      brandSubName: "318i",
      fullBrandName: "BMW 318i",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 24,
      brandName: "BMW",
      brandSubName: "320i",
      fullBrandName: "BMW 320i",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 1,
      brandSub: 42,
      brandName: "BMW",
      brandSubName: "340i",
      fullBrandName: "BMW 340i",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 40,
      brandName: "BMW",
      brandSubName: "418i",
      fullBrandName: "BMW 418i",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 34,
      brandName: "BMW",
      brandSubName: "520I",
      fullBrandName: "BMW 520I",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 1,
      brandSub: 50,
      brandName: "BMW",
      brandSubName: "530I",
      fullBrandName: "BMW 530I",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 10,
      brandName: "BMW",
      brandSubName: "730Li",
      fullBrandName: "BMW 730Li",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 23,
      brandName: "BMW",
      brandSubName: "740LI",
      fullBrandName: "BMW 740LI",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 12,
      brandName: "BMW",
      brandSubName: "750i",
      fullBrandName: "BMW 750i",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 27,
      brandName: "BMW",
      brandSubName: "X1",
      fullBrandName: "BMW X1",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 1,
      brandSub: 48,
      brandName: "BMW",
      brandSubName: "X2",
      fullBrandName: "BMW X2",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 1,
      brandSub: 14,
      brandName: "BMW",
      brandSubName: "X3",
      fullBrandName: "BMW X3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 1,
      brandSub: 44,
      brandName: "BMW",
      brandSubName: "x4",
      fullBrandName: "BMW x4",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 15,
      brandName: "BMW",
      brandSubName: "x5",
      fullBrandName: "BMW x5",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 1,
      brandSub: 32,
      brandName: "BMW",
      brandSubName: "X6",
      fullBrandName: "BMW X6",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 1,
      brandSub: 54,
      brandName: "BMW",
      brandSubName: "X 7",
      fullBrandName: "BMW X 7",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 5,
      brandSub: 1,
      brandName: "سكودا",
      brandSubName: "اوكتافيا",
      fullBrandName: "سكودا اوكتافيا",

      countryOfOrigin: "9"),






  CarBrand(brandMain: 5,
      brandSub: 20,
      brandName: "سكودا",
      brandSubName: "كودياك",
      fullBrandName: "سكودا كودياك",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 5,
      brandSub: 25,
      brandName: "سكودا",
      brandSubName: "سكالا",
      fullBrandName: "سكودا سكالا",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 5,
      brandSub: 23,
      brandName: "سكودا",
      brandSubName: "كاميك",
      fullBrandName: "سكودا كاميك",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 5,
      brandSub: 21,
      brandName: "سكودا",
      brandSubName: "كاروك",
      fullBrandName: "سكودا كاروك",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 5,
      brandSub: 19,
      brandName: "سكودا",
      brandSubName: "سوبيرب",
      fullBrandName: "سكودا سوبيرب",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 38,
      brandSub: 30,
      brandName: "فيات",
      brandSubName: "500",
      fullBrandName: "فيات 500",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 38,
      brandSub: 43,
      brandName: "فيات",
      brandSubName: "500C",
      fullBrandName: "فيات 500C",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 38,
      brandSub: 41,
      brandName: "فيات",
      brandSubName: "500X",
      fullBrandName: "فيات 500X",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 38,
      brandSub: 11,
      brandName: "فيات",
      brandSubName: "بونتو",
      fullBrandName: "فيات بونتو",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 38,
      brandSub: 27,
      brandName: "فيات",
      brandSubName: "تيبو",
      fullBrandName: "فيات تيبو",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 38,
      brandSub: 39,
      brandName: "فيات",
      brandSubName: "دوبلو",
      fullBrandName: "فيات دوبلو",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 285,
      brandSub: 2,
      brandName: "MG",
      brandSubName: "MG 5",
      fullBrandName: "MG MG 5",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 285,
      brandSub: 7,
      brandName: "MG",
      brandSubName: "MG 6",
      fullBrandName: "MG MG 6",

      countryOfOrigin: "9"),


  CarBrand(brandMain: 285,
      brandSub: 9,
      brandName: "MG",
      brandSubName: "MG  HS",
      fullBrandName: "MG MG  HS",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 285,
      brandSub: 8,
      brandName: "MG",
      brandSubName: "MG  RX5",
      fullBrandName: "MG MG  RX5",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 285,
      brandSub: 6,
      brandName: "MG",
      brandSubName: "MG  ZS",
      fullBrandName: "MG MG  ZS",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 35,
      brandSub: 16,
      brandName: "فورد",
      brandSubName: "فوكاس",
      fullBrandName: "فورد فوكاس",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 35,
      brandSub: 19,
      brandName: "فورد",
      brandSubName: "فيوجين",
      fullBrandName: "فورد فيوجين",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 35,
      brandSub: 23,
      brandName: "فورد",
      brandSubName: "ايكو سبورت ",
      fullBrandName: "فورد ايكو سبورت ",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 35,
      brandSub: 20,
      brandName: "فورد",
      brandSubName: "كوجا",
      fullBrandName: "فورد كوجا",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 74,
      brandSub: 4,
      brandName: "سوبارو",
      brandSubName: "XV",
      fullBrandName: "سوبارو XV",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 1,
      brandName: "اودى",
      brandSubName: "A3",
      fullBrandName: "اودى A3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 2,
      brandName: "اودى",
      brandSubName: "A4",
      fullBrandName: "اودى A4",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 11,
      brandName: "اودى",
      brandSubName: "A5",
      fullBrandName: "اودى A5",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 10,
      brandSub: 3,
      brandName: "اودى",
      brandSubName: "A6",
      fullBrandName: "اودى A6",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 13,
      brandName: "اودى",
      brandSubName: "Q2",
      fullBrandName: "اودى Q2",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 10,
      brandName: "اودى",
      brandSubName: "Q3",
      fullBrandName: "اودى Q3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 6,
      brandName: "اودى",
      brandSubName: "Q7",
      fullBrandName: "اودى Q7",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 14,
      brandName: "اودى",
      brandSubName: "Q8",
      fullBrandName: "اودى Q8",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 10,
      brandSub: 14,
      brandName: "اودى",
      brandSubName: "RS Q8",
      fullBrandName: "اودى RS Q8",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 87,
      brandSub: 8,
      brandName: "جيب",
      brandSubName: "جراند شيروكى",
      fullBrandName: "جيب جراند شيروكى",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 87,
      brandSub: 6,
      brandName: "جيب",
      brandSubName: "رينجيد",
      fullBrandName: "جيب رينجيد",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 8,
      brandSub: 4,
      brandName: "اوبل",
      brandSubName: "استرا ",
      fullBrandName: "اوبل استرا ",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 8,
      brandSub: 4,
      brandName: "اوبل",
      brandSubName: "استرا ",
      fullBrandName: "اوبل استرا ",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 8,
      brandSub: 8,
      brandName: "اوبل",
      brandSubName: "انسيجنيا ",
      fullBrandName: "اوبل انسيجنيا ",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 8,
      brandSub: 12,
      brandName: "اوبل",
      brandSubName: "جراند لاند ",
      fullBrandName: "اوبل جراند لاند ",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 8,
      brandSub: 3,
      brandName: "اوبل",
      brandSubName: "كورسا",
      fullBrandName: "اوبل كورسا",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 8,
      brandSub: 11,
      brandName: "اوبل",
      brandSubName: "موكا",
      fullBrandName: "اوبل موكا",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 8,
      brandSub: 13,
      brandName: "اوبل",
      brandSubName: "كروس لاند ",
      fullBrandName: "اوبل كروس لاند ",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 407,
      brandSub: 2,
      brandName: "هافال",
      brandSubName: "H6",
      fullBrandName: "هافال H6",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 407,
      brandSub: 1,
      brandName: "هافال",
      brandSubName: "جولايون",
      fullBrandName: "هافال جولايون",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 152,
      brandSub: 2,
      brandName: "BYD",
      brandSubName: "F3",
      fullBrandName: "BYD F3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 152,
      brandSub: 4,
      brandName: "BYD",
      brandSubName: "L3",
      fullBrandName: "BYD L3",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 403,
      brandSub: 1,
      brandName: "جيتور",
      brandSubName: "X70",
      fullBrandName: "جيتور X70",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 403,
      brandSub: 2,
      brandName: "جيتور",
      brandSubName: "X95",
      fullBrandName: "جيتور X95",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 13,
      brandSub: 40,
      brandName: "بيجو",
      brandSubName: "2008",
      fullBrandName: "بيجو 2008",
      countryOfOrigin: "9"),





  CarBrand(brandMain: 13,
      brandSub: 30,
      brandName: "بيجو",
      brandSubName: "3008",
      fullBrandName: "بيجو 3008",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 13,
      brandSub: 38,
      brandName: "بيجو",
      brandSubName: "301",
      fullBrandName: "بيجو 301",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 13,
      brandSub: 36,
      brandName: "بيجو",
      brandSubName: "5008",
      fullBrandName: "بيجو 5008",
      countryOfOrigin: "9"),





  CarBrand(brandMain: 13,
      brandSub: 31,
      brandName: "بيجو",
      brandSubName: "508",
      fullBrandName: "بيجو 508",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 13,
      brandSub: 31,
      brandName: "بيجو",
      brandSubName: "508",
      fullBrandName: "بيجو 508",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 17,
      brandName: "سوزوكى",
      brandSubName: "ارتيجا",
      fullBrandName: "سوزوكى ارتيجا",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 6,
      brandName: "سوزوكى",
      brandSubName: "التو",
      fullBrandName: "سوزوكى التو",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 24,
      brandName: "سوزوكى",
      brandSubName: "اسبريسو",
      fullBrandName: "سوزوكى اسبريسو",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 10,
      brandName: "سوزوكى",
      brandSubName: "جيمنى",
      fullBrandName: "سوزوكى جيمنى",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 25,
      brandName: "سوزوكى",
      brandSubName: "ديزاير",
      fullBrandName: "سوزوكى ديزاير",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 29,
      brandSub: 19,
      brandName: "سوزوكى",
      brandSubName: "سياز",
      fullBrandName: "سوزوكى سياز",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 1,
      brandName: "سوزوكى",
      brandSubName: "سويفت",
      fullBrandName: "سوزوكى سويفت",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 5,
      brandName: "سوزوكى",
      brandSubName: "بالينو",
      fullBrandName: "سوزوكى بالينو",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 4,
      brandName: "سوزوكى",
      brandSubName: "فان",
      fullBrandName: "سوزوكى فان",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 29,
      brandSub: 2,
      brandName: "سوزوكى",
      brandSubName: "فيتارا",
      fullBrandName: "سوزوكى فيتارا",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 30,
      brandSub: 2,
      brandName: "سيات",
      brandSubName: "أبيزا",
      fullBrandName: "سيات أبيزا",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 30,
      brandSub: 11,
      brandName: "سيات",
      brandSubName: "أتيكا",
      fullBrandName: "سيات أتيكا",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 30,
      brandSub: 3,
      brandName: "سيات",
      brandSubName: "توليدو",
      fullBrandName: "سيات توليدو",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 30,
      brandSub: 8,
      brandName: "سيات",
      brandSubName: "ليون",
      fullBrandName: "سيات ليون",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 30,
      brandSub: 12,
      brandName: "سيات",
      brandSubName: "ارونا",
      fullBrandName: "سيات ارونا",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 30,
      brandSub: 12,
      brandName: "سيات",
      brandSubName: "ارونا",
      fullBrandName: "سيات ارونا",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 30,
      brandSub: 13,
      brandName: "سيات",
      brandSubName: "تاراكو",
      fullBrandName: "سيات تاراكو",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 28,
      brandSub: 14,
      brandName: "سيتروين",
      brandSubName: "سى اليزيه",
      fullBrandName: "سيتروين سى اليزيه",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 28,
      brandSub: 1,
      brandName: "سيتروين",
      brandSubName: "C3",
      fullBrandName: "سيتروين C3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 28,
      brandSub: 1,
      brandName: "سيتروين",
      brandSubName: "ايركروس C3",
      fullBrandName: "سيتروين ايركروس C3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 28,
      brandSub: 3,
      brandName: "سيتروين",
      brandSubName: "ايركروس C5",
      fullBrandName: "سيتروين ايركروس C5",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 28,
      brandSub: 2,
      brandName: "سيتروين",
      brandSubName: "C4",
      fullBrandName: "سيتروين C4",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 28,
      brandSub: 2,
      brandName: "سيتروين",
      brandSubName: "C4",
      fullBrandName: "سيتروين C4",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 28,
      brandSub: 18,
      brandName: "سيتروين",
      brandSubName: "C4 جراند بيكاسو",
      fullBrandName: "سيتروين C4 جراند بيكاسو",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 36,
      brandSub: 25,
      brandName: "فولفو",
      brandSubName: "XC40",
      fullBrandName: "فولفو XC40",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 36,
      brandSub: 4,
      brandName: "فولفو",
      brandSubName: "V 60",
      fullBrandName: "فولفو V 60",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 36,
      brandSub: 17,
      brandName: "فولفو",
      brandSubName: "XC 60",
      fullBrandName: "فولفو XC 60",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 36,
      brandSub: 17,
      brandName: "فولفو",
      brandSubName: "XC 60",
      fullBrandName: "فولفو XC 60",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 36,
      brandSub: 7,
      brandName: "فولفو",
      brandSubName: "XC 90",
      fullBrandName: "فولفو XC 90",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 41,
      brandSub: 16,
      brandName: "لادا",
      brandSubName: "جرانتا",
      fullBrandName: "لادا جرانتا",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 53,
      brandSub: 6,
      brandName: "هوندا",
      brandSubName: "CRV",
      fullBrandName: "هوندا CRV",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 53,
      brandSub: 4,
      brandName: "هوندا",
      brandSubName: "HR-V",
      fullBrandName: "هوندا HR-V",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 53,
      brandSub: 1,
      brandName: "هوندا",
      brandSubName: "أكورد",
      fullBrandName: "هوندا أكورد",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 53,
      brandSub: 2,
      brandName: "هوندا",
      brandSubName: "سيتى",
      fullBrandName: "هوندا سيتى",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 53,
      brandSub: 3,
      brandName: "هوندا",
      brandSubName: "سيفك",
      fullBrandName: "هوندا سيفك",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 44,
      brandSub: 1,
      brandName: "مازدا",
      brandSubName: "مازدا 3",
      fullBrandName: "مازدا مازدا 3",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 46,
      brandSub: 3,
      brandName: "مرسيدس",
      brandSubName: "C180",
      fullBrandName: "مرسيدس C180",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 46,
      brandSub: 3,
      brandName: "مرسيدس",
      brandSubName: "C180",
      fullBrandName: "مرسيدس C180",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 46,
      brandSub: 4,
      brandName: "مرسيدس",
      brandSubName: "C 200",
      fullBrandName: "مرسيدس C 200",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 46,
      brandSub: 71,
      brandName: "مرسيدس",
      brandSubName: "CLA 180",
      fullBrandName: "مرسيدس CLA 180",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 46,
      brandSub: 84,
      brandName: "مرسيدس",
      brandSubName: "E 180",
      fullBrandName: "مرسيدس E 180",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 46,
      brandSub: 45,
      brandName: "مرسيدس",
      brandSubName: "E 300",
      fullBrandName: "مرسيدس E 300",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 46,
      brandSub: 6,
      brandName: "مرسيدس",
      brandSubName: "E 200",
      fullBrandName: "مرسيدس E 200",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 46,
      brandSub: 60,
      brandName: "مرسيدس",
      brandSubName: "A 200",
      fullBrandName: "مرسيدس A 200",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 46,
      brandSub: 77,
      brandName: "مرسيدس",
      brandSubName: "GLA 200",
      fullBrandName: "مرسيدس GLA 200",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 47,
      brandSub: 29,
      brandName: "متسوبيشى",
      brandSubName: "اكسباندر",
      fullBrandName: "متسوبيشى اكسباندر",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 47,
      brandSub: 28,
      brandName: "متسوبيشى",
      brandSubName: "اكليبس كروس",
      fullBrandName: "متسوبيشى اكليبس كروس",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 47,
      brandSub: 3,
      brandName: "متسوبيشى",
      brandSubName: "لانسر",
      fullBrandName: "متسوبيشى لانسر",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 50,
      brandSub: 18,
      brandName: "نيسان",
      brandSubName: "جوك بلاتينيوم",
      fullBrandName: "نيسان جوك بلاتينيوم",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 50,
      brandSub: 19,
      brandName: "نيسان",
      brandSubName: "سنترا",
      fullBrandName: "نيسان سنترا",
      countryOfOrigin: "9"),


  CarBrand(brandMain: 50,
      brandSub: 2,
      brandName: "نيسان",
      brandSubName: "صني",
      fullBrandName: "نيسان صني",
      countryOfOrigin: "9"),





  CarBrand(brandMain: 50,
      brandSub: 16,
      brandName: "نيسان",
      brandSubName: "قاشقاي",
      fullBrandName: "نيسان قاشقاي",
      countryOfOrigin: "9"),


  CarBrand(brandMain: 26,
      brandSub: 27,
      brandName: "رينو",
      brandSubName: "داستر",
      fullBrandName: "رينو داستر",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 26,
      brandSub: 37,
      brandName: "رينو",
      brandSubName: "سانديرو",
      fullBrandName: "رينو سانديرو",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 26,
      brandSub: 31,
      brandName: "رينو",
      brandSubName: "سانديرو ستيب واى",
      fullBrandName: "رينو سانديرو ستيب واى",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 26,
      brandSub: 39,
      brandName: "رينو",
      brandSubName: "كابتشر",
      fullBrandName: "رينو كابتشر",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 26,
      brandSub: 42,
      brandName: "رينو",
      brandSubName: "كادجار",
      fullBrandName: "رينو كادجار",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 26,
      brandSub: 16,
      brandName: "رينو",
      brandSubName: "لوجان",
      fullBrandName: "رينو لوجان",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 26,
      brandSub: 3,
      brandName: "رينو",
      brandSubName: "ميجان ",
      fullBrandName: "رينو ميجان ",

      countryOfOrigin: "9"),






  CarBrand(brandMain: 54,
      brandSub: 20,
      brandName: "هيونداى",
      brandSubName: "i 10",
      fullBrandName: "هيونداى i 10",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 54,
      brandSub: 30,
      brandName: "هيونداى",
      brandSubName: "أكسنت 3",
      fullBrandName: "هيونداى أكسنت 3",

      countryOfOrigin: "9"),





  CarBrand(brandMain: 54,
      brandSub: 48,
      brandName: "هيونداى",
      brandSubName: "أكسنت\r\nHCI",
      fullBrandName: "هيونداى أكسنت\r\nHCI",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 45,
      brandName: "هيونداى",
      brandSubName: "النترا AD",
      fullBrandName: "هيونداى النترا AD",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 51,
      brandName: "هيونداى",
      brandSubName: "النترا\r\nCN7",
      fullBrandName: "هيونداى النترا\r\nCN7",
      countryOfOrigin: "9"),




  CarBrand(brandMain: 54,
      brandSub: 43,
      brandName: "هيونداى",
      brandSubName: "النترا HD",
      fullBrandName: "هيونداى النترا HD",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 54,
      brandSub: 43,
      brandName: "هيونداى",
      brandSubName: "النترا HD",
      fullBrandName: "هيونداى النترا HD",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 7,
      brandName: "هيونداى",
      brandSubName: "توسان",
      fullBrandName: "هيونداى توسان",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 7,
      brandName: "هيونداى",
      brandSubName: "توسان\r\nNX4E",
      fullBrandName: "هيونداى توسان\r\nNX4E",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 38,
      brandName: "هيونداى",
      brandSubName: "جراند i10",
      fullBrandName: "هيونداى جراند i10",
      countryOfOrigin: "9"),

  CarBrand(brandMain: 54,
      brandSub: 29,
      brandName: "هيونداى",
      brandSubName: "i 20",
      fullBrandName: "هيونداى i 20",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 54,
      brandName: "هيونداى",
      brandSubName: "بايون",
      fullBrandName: "هيونداى بايون",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 54,
      brandSub: 5,
      brandName: "هيونداى",
      brandSubName: "فيرنا ",
      fullBrandName: "هيونداى فيرنا ",

      countryOfOrigin: "9"),



  CarBrand(brandMain: 54,
      brandSub: 41,
      brandName: "هيونداى",
      brandSubName: "كريتا",
      fullBrandName: "هيونداى كريتا",

      countryOfOrigin: "9"),




  CarBrand(brandMain: 54,
      brandSub: 41,
      brandName: "هيونداى",
      brandSubName: "كريتا\r\nSU2",
      fullBrandName: "هيونداى كريتا\r\nSU2",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 16,
      brandSub: 37,
      brandName: "تويوتا",
      brandSubName: "C-HR",
      fullBrandName: "تويوتا C-HR",
      countryOfOrigin: "9"),


  CarBrand(brandMain: 16,
      brandSub: 48,
      brandName: "تويوتا",
      brandSubName: "بيلتا",
      fullBrandName: "تويوتا بيلتا",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 16,
      brandSub: 40,
      brandName: "تويوتا",
      brandSubName: "راش",
      fullBrandName: "تويوتا راش",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 16,
      brandSub: 30,
      brandName: "تويوتا",
      brandSubName: "فورتشنر",
      fullBrandName: "تويوتا فورتشنر",
      countryOfOrigin: "9"),



  CarBrand(brandMain: 16,
      brandSub: 42,
      brandName: "تويوتا",
      brandSubName: "كورولا",
      fullBrandName: "تويوتا كورولا",

      countryOfOrigin: "9"),


  CarBrand(brandMain: 16,
      brandSub: 26,
      brandName: "تويوتا",
      brandSubName: "ياريس",
      fullBrandName: "تويوتا ياريس",

      countryOfOrigin: "9"),

  CarBrand(brandMain: 16,
      brandSub: 49,
      brandName: "تويوتا",
      brandSubName: "روميون",
      fullBrandName: "تويوتا روميون",

      countryOfOrigin: "9"),



];
