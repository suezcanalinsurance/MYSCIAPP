import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';



class ProfileData
{
  Crud crud;
  ProfileData(this.crud);
  getData() async{
    var response=await crud.postData(AppLink.producers, {
      "searchdata":""
    });

    return response.fold((l) => l, (r) => r);
  }


  searchData(String prducerdata) async {
    var response = await crud.postData(AppLink.producers, {
      "searchdata":prducerdata

    });

    return response.fold((l) => l, (r) => r);
  }

}