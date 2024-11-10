import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class VerifyCodeData {
  Crud crud;

  VerifyCodeData(this.crud);

  postdata( String email,String VerifyCode) async {
    var response = await crud.postData(AppLink.VerifyCode, {
      "email":email,
      "verifycode":VerifyCode,

    });

    return response.fold((l) => l, (r) => r);

  }
}
