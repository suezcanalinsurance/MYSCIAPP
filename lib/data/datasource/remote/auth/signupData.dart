import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postData(String username,String password,String email,String phone) async {


    print(username);
    print(password);
    print(email);
    print(phone);

    var response = await crud.postData(AppLink.sign_up, {
      "username":username,
      "password":password,
      "email":email,
      "phone":phone
        });

print(response);
    return response.fold((l) => l, (r) => r);
  }
}
