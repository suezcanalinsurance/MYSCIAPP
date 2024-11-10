import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/stepper_controller.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'package:suezproduction/data/model/carBrand.dart';

class PolpricingForm extends StatelessWidget {
  final StepperController _controller = Get.put(StepperController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('إحصل على عرض لتأمين سياراتك')),
        body:_controller.statusRequest==StatusRequest.loading ? Center(child: Text("loading ...")): Form(

          child: GetBuilder<StepperController>(
            builder: (controller) => Stepper(
              type: StepperType.horizontal,
              currentStep: _controller.currentStep,
              steps: controller.steps(),
              onStepContinue: _controller.nextStep,
              onStepCancel: _controller.previousStep,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('رجوع'),
                      style: TextButton.styleFrom(primary: Colors.orange),
                    ),
                    TextButton(
                      onPressed: details.onStepContinue,
                      child: const Text('التالي'),
                      style: TextButton.styleFrom(primary: Colors.lightGreen),
                    ),

                  ],
                );
              },
            ),
          ),
        ));
  }
}
