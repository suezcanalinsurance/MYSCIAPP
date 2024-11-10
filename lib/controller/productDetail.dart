import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/productdetail_data.dart';
import 'package:get/get.dart';

abstract class  ProductDetail extends GetxController{
  getData();
}

class ProductDetailTmp extends ProductDetail
{
  ProductDetailData productData=new ProductDetailData(Get.find());

  List data = [];
  String productId="1";
  late StatusRequest statusRequest;

  void initialData() {
    productId=Get.arguments["productId"];
  }
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await productData.getData(productId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }   if (response['status'] == "nodata") {
        statusRequest = StatusRequest.noData ;
      }else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }


}
