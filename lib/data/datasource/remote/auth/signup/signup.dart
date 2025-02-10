import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';

class SignUP {
  CRUD crud;
  SignUP(this.crud);

  Sendingdata(
    String name,
    String email,
    String phone,
    String Password,
    String Confpassword,
  ) async {
    var response =
        await crud.postdataAuthhandelingresponse(APPlinks.SignUPlink, {
      "name": name,
      "email": email,
      "phone": phone,
      "password": Password,
      "password_confirmation": Confpassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
