import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';



class ItemData
{
   Crud crud;
   ItemData(this.crud);
  getData(String catId) async{
    var response=await crud.postData(AppLink.items, {
      "catId":catId
    });
   // print(response);
    return response.fold((l) => l, (r) => r);
  }

}