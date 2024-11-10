import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class ReactiveCodeData {
  Crud crud;

  ReactiveCodeData(this.crud);

  postData(String email) async {


    var response = await crud.postData(AppLink.active, {
           "email":email

    });


    return response.fold((l) => l, (r) => r);
  }
}
