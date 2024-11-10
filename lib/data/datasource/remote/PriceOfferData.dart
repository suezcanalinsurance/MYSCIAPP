import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class PriceOfferData {
  Crud crud;

  PriceOfferData(this.crud);

  postData( String name,String cardId,String email,String address,String phone,String inskind,String offerInsName,String amount,String subject,String mailTo) async {
    var response = await crud.postData(AppLink.send_offerprice, {
      "name":name,
      "cardId":cardId,
      "email":email,
      "address":address,
      "phone":phone,
      "inskind":inskind,
      "InsName":offerInsName,
      "amount":amount,
      "subject":subject,
      "mailTo":mailTo,

    });
    return response.fold((l) => l, (r) => r);
  }

  postDataEmail( String name,String cardId,String Passport,String email,String address,String phone,String inskind,String offerInsName,String amount,String subject,String mailTo) async {
    var response = await crud.postData(AppLink.send_email_offerprice, {
      "name":name,
      "cardId":cardId,
      "passport":Passport,
      "email":email,
      "address":address,
      "phone":phone,
      "inskind":inskind,
      "InsName":offerInsName,
      "amount":amount,
      "subject":subject,
      "mailTo":mailTo,

    });
    return response.fold((l) => l, (r) => r);
  }



}
