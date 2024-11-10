import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ProductUrlController.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ProductUrl extends StatelessWidget {
  final ProductUrlController controller = Get.put(ProductUrlController());
  ServiceController servicecontroller = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
/*      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Action to be taken when the button is pressed
          if (  servicecontroller.isLogin()== true) {
            _showPopup(context);
          }
          else {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('registerFirst'.tr),
                backgroundColor: Colors.red,
              ),
            );
          }


        },
        icon: Icon(Icons.email),
        label: Text("Sendmessage".tr,style: TextStyle(color: Colors.white,fontSize:12)),
        backgroundColor: Colors.blue, // Background color of the button
      ),*/
      appBar: AppBar(

      //  title: Text(controller.categoryname!), // GetX localized string
      ),
      body: GetBuilder<ProductUrlController>( // GetBuilder for manual updates
        builder: (controller) => Stack(
          children: [
            WebViewWidget(controller: controller.webViewController),
            if (controller.loadingPercentage < 100)
              LinearProgressIndicator(
                value: controller.loadingPercentage / 100.0,
              ),
          ],
        ),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sendmessage'.tr+ controller.categoryname.toString() ),
          content: Form(
            key: controller.formKeyitem,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(controller.email!,style: TextStyle(color: Colors.blue,fontSize: 14),),
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'name'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pleaseenterthename'.tr;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.subjectController,
                  decoration: InputDecoration(
                    labelText: 'message'.tr,
                  ),
                  maxLines: 5, // Allows the text field to expand as a textarea
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pleaseenterthemessage'.tr;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('cancel'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.formKeyitem.currentState!.validate()) {
                  controller.sendEmail();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('sendsucess'.tr),
                      backgroundColor: Colors.green,
                    ),
                  );

                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set the button color to blue
              ),
              child: Text('send'.tr,style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}
