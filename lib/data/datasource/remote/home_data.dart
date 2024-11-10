import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';



class HomeData
{
   Crud crud;
  HomeData(this.crud);
  getData() async{
    var response=await crud.postData(AppLink.home, {});
   // print(response);
    return response.fold((l) => l, (r) => r);
  }

}