import 'package:suezproduction/controller/productDetail.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/data/model/items_model.dart';
import 'package:suezproduction/view/widget/items/customProductDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Productdetail extends StatelessWidget {
  const Productdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailTmp controller=Get.put(ProductDetailTmp());
    print(controller.getData());
    return GetBuilder<ProductDetailTmp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget:
    Column(
      children: [
        CustomProductDetail(item_model: itemsmodel.fromJson(controller.getData()),)
      ],
    )

    ));
  }
}


