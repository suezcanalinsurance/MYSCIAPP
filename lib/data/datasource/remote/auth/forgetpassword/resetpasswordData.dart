import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class ResetpasswordData
{
  Crud crud;
  ResetpasswordData(this.crud);

  postdata(String email,String password) async
  {
    var response =await crud.postData(AppLink.resetpassword,  {
      "email":email,
      "password":password

    });
    return response.fold((l) => l, (r) => r);

  }
}