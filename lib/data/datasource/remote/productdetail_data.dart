import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';



class ProductDetailData
{
   Crud crud;
   ProductDetailData(this.crud);
  getData(String productId) async{
    var response=await crud.postData(AppLink.productdetail, {
      "productId":productId
    });
   // print(response);
    return response.fold((l) => l, (r) => r);
  }

}