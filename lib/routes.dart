import 'package:suezproduction/view/screen/AccidentReport.dart';
import 'package:suezproduction/view/screen/GoogleMap.dart';
import 'package:suezproduction/view/screen/ProductUrl.dart';
import 'package:suezproduction/view/screen/ShowPrice.dart';
import 'package:suezproduction/view/screen/auth/re_activation.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/middleware/mymiddleware.dart';

import 'package:suezproduction/view/screen/CheckPolicy_Result.dart';

import 'package:suezproduction/view/screen/NewBranches.dart';

import 'package:suezproduction/view/screen/Productdetail.dart';
import 'package:suezproduction/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:suezproduction/view/screen/auth/login.dart';
import 'package:suezproduction/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:suezproduction/view/screen/auth/signup.dart';
import 'package:suezproduction/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:suezproduction/view/screen/auth/success_signup.dart';
import 'package:suezproduction/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:suezproduction/view/screen/auth/verifycodesignup.dart';
import 'package:suezproduction/view/screen/claimpage.dart';
import 'package:suezproduction/view/screen/claimpage_result.dart';
import 'package:suezproduction/view/screen/contactus.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/screen/language.dart';

import 'package:suezproduction/view/screen/onboarding.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:get/get.dart';
import 'package:suezproduction/view/screen/items.dart';
import 'package:suezproduction/view/screen/ourproducts.dart';



List<GetPage<dynamic>>? routes = [

   GetPage(name: "/", page: () =>  Language() , middlewares: [
  MyMiddleWare()
  ]),
    GetPage(name: "/", page: () => OnBoarding()),

  GetPage(name: AppRoute.login, page: () =>  Login()),
  GetPage(name: AppRoute.signUp, page: () =>  SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.home, page: () =>  HomePage()),
  GetPage(name: AppRoute.items, page: () =>  Items()),
  GetPage(name: AppRoute.productdetail, page: () => const Productdetail()),
  GetPage(name: AppRoute.OnLinepay, page: () =>  OnLinepay()),
  GetPage(name: AppRoute.contactus, page: () =>  contactus()),
  GetPage(name: AppRoute.CheckPolicy_Result, page: () =>  CheckPolicy_Result()),
  GetPage(name: AppRoute.Branches, page: () =>  NewBranches()),
  GetPage(name: AppRoute.ReActivation, page: () =>  ReActivation()),
  GetPage(name: AppRoute.MapSample, page: () =>  MapSample()),
  GetPage(name: AppRoute.showprice, page: () =>  showprice()),
  GetPage(name: AppRoute.ClaimpageResult, page: () =>  ClaimpageResult()),
  GetPage(name: AppRoute.claimpage, page: () =>  claimpage()),
  GetPage(name: AppRoute.ourproduct, page: () =>  ourproduct()),
  GetPage(name: AppRoute.Language, page: () =>  Language()),
  GetPage(name: AppRoute.AccidentReportForm, page: () =>  AccidentReportForm()),
  GetPage(name: AppRoute.ProductUrl, page: () =>  ProductUrl()),
];
 