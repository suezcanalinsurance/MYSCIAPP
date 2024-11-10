import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class SigninData {
  Crud crud;

  SigninData(this.crud);

  postData(String email,String password) async {
    var response = await crud.postData(AppLink.signin, {
      "email":email,
      "password":password

    });

    return response.fold((l) => l, (r) => r);
  }
}
