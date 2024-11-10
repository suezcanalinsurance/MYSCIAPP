import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData( String email,String VerifyCode) async {
    var response = await crud.postData(AppLink.VerifyCodesign_up, {
      "email":email,
      "verifycode":VerifyCode,

    });
    return response.fold((l) => l, (r) => r);
  }
}
