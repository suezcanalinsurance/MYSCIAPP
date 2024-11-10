import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class ClaimPolicyData {
  Crud crud;

  ClaimPolicyData(this.crud);

  postData( String policyNo,String ChsNo) async {
    var response = await crud.postData(AppLink.getpolicyclaim, {
      "policyNum":policyNo,
      "ChsNo":ChsNo

    });

    return response.fold((l) => l, (r) => r);
  }
}