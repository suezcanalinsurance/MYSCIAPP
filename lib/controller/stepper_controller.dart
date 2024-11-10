import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/PricePol.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'dart:convert';
import 'package:suezproduction/data/model/carBrand.dart';
import 'package:suezproduction/data/model/priceinfo.dart';



class StepperController extends GetxController {
  final TextEditingController autocompleteController = TextEditingController();
  final TextEditingController insuranceAmountController =     TextEditingController();
  final TextEditingController mobileNoController =     TextEditingController();
  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  late StatusRequest statusRequest = StatusRequest.none;


  MyServices myServices=Get.find();
  PricePolData pricedata = PricePolData(Get.find());
  var currentStep = 0;
  var brandMain = 0;
  var brandSub = 0;
  var selectedBrand = '';
  var mobileNo = '';
  var selectedYear = Rxn<int>();
  var insuranceAmount = '';
  var isLoading = false;
  var resultData = {};

  final List<int> years = List<int>.generate(100, (index) => DateTime.now().year - index);
  List<Step> steps() {
    return [
      Step(
        title: Text(''),
        content: Column(
          children: <Widget>[
             Form(
        key: _formKeys[0],
            child: TypeAheadFormField<CarBrand>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: autocompleteController,
                decoration: InputDecoration(labelText: 'نوع وماركة السيارة'),
              ),
              suggestionsCallback: (pattern) {
                return carBrands.where((carBrand) => carBrand.fullBrandName
                    .toLowerCase()
                    .contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, CarBrand suggestion) {
                return ListTile(
                  title: Text(suggestion.fullBrandName),
                );
              },
              onSuggestionSelected: (CarBrand suggestion) {
                autocompleteController.text = suggestion.fullBrandName;
                selectedBrand = suggestion.fullBrandName;
                brandMain=suggestion.brandMain;
                brandSub=suggestion.brandSub;
                update();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء اختيار ماركة السيارة';
                }
                return null;
              },
            )),
          ],
        ),
        isActive: currentStep >= 0,
      ),
      Step(
        title: Text(''),
        content: Column(
          children: [
            Form(
                key: _formKeys[1],
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(labelText: '   سنة الصنع '),
                  value: selectedYear.value,
                  onChanged: (int? newValue) {
                    selectedYear.value = newValue;
                  },
                  items: years.map((int year) {
                    return DropdownMenuItem<int>(
                      value: year,
                      child: Text(year.toString()),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'الرجاء اختيار سنة الصنع';
                    }
                    return null;
                  },
                )),
          ],
        ),
        isActive: currentStep >= 1,
      ),
      Step(
        title: Text(''),
        content: Column(
          children: [
            Form(
        key: _formKeys[2],
          child: TextFormField(
              controller: insuranceAmountController,
              decoration: InputDecoration(labelText: 'مبلغ التأمين'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال مبلغ التأمين';
                }
                final n = num.tryParse(value);
                if (n == null) {
                  return 'الرجاء إدخال مبلغ صحيح';
                }
                return null;
              },
              onChanged: (value) {
                insuranceAmount = value;
                update();
              },
            )),
          ],
        ),
        isActive: currentStep >= 2,
      ),
      Step(
        title: Text(''),
        content: Column(
          children: [

            Text('ممكن أعرف ؟'),
         Form(
    key: _formKeys[3],
    child:TextFormField(
              controller: mobileNoController,
              decoration: InputDecoration(labelText: 'رقم موبايلك'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء     رقم الهاتف';
                }
                final n = num.tryParse(value);
                if (n == null) {
                  return 'الرجاء إدخال رقم الهاتف صحيح';
                }
                return null;
              },
              onChanged: (value) {
                mobileNo = value;
              },
    ) ),
           /* DropdownButtonFormField<int>(
              decoration: InputDecoration(labelText: '  رقم موبايلك'),
              value: selectedYear.value,
              onChanged: (int? newValue) {
                selectedYear.value = newValue;
              },
              items: years.map((int year) {
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text(year.toString()),
                );
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'الرجاء اختيار سنة الصنع';
                }
                return null;
              },
            ),*/
          ],
        ),
        isActive: currentStep >= 3,
      ),
    ];
  }

    callApi() async {
      List data = [];
      policyInfoModel  priceinfo;

print(insuranceAmount);
print(brandMain);
print(brandSub);

      final response = await pricedata.getData(insuranceAmount,brandMain.toString(),brandSub.toString());

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        priceinfo= policyInfoModel.fromJson(data[0]);
            Get.toNamed(AppRoute.showprice, arguments: {
          "TotalPrem":priceinfo.TotalPrem

        });
      }
      }
    else
      {
        Get.dialog(AlertDialog(
          title: Text('رسالة تحذبرية'),
          content: Text('حدثت مشكلة نرجو التجربة بعد وقت قريب'),
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
/*   Get.dialog(AlertDialog(
          title: Text('نتائج الطلب'),
          content: Text('البيانات المستلمة: $responseData'),
          actions: <Widget>[
            TextButton(
              child: Text('إغلاق'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ));*/

  }



  void nextStep() {
    if (_formKeys[currentStep].currentState!.validate()) {
      _formKeys[currentStep].currentState!.save();
      if (currentStep < steps().length - 1) {

        currentStep++;
        update();
      } else {
        statusRequest = StatusRequest.loading;
        update();
        callApi();
      }}

  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      update();
    }
  }

}
