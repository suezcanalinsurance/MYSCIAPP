import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';



class PricePolData
{
  Crud crud;
  PricePolData(this.crud);
  getData(String insuranceAmount,String brandMain,String brandSub) async{
    var response=await crud.postData(AppLink.priceme, {
      "gas": "1",
      "Brand": brandMain,
      "FirstYear": insuranceAmount,
      "Txt_carType": brandSub,
      "vehicleType": brandSub,
      "CountryOfOrigin_hid": "0"
    });
    return response.fold((l) => l, (r) => r);
  }




}