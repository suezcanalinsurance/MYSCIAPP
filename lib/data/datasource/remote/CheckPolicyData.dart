import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class CheckPolicyData {
  Crud crud;

  CheckPolicyData(this.crud);

  postData( String policyNo,String stickerNo) async {
    var response = await crud.postData(AppLink.CheckPolicyData, {
      "policyNum":policyNo,
      "serail":stickerNo

    });

    return response.fold((l) => l, (r) => r);
  }
}