import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';

class Login {
  CRUD crud;
  Login(this.crud);

  Sendingdata(
    String email,
    String password,
  ) async {
    var response = await crud.postdataAuthhandelingresponse(
      APPlinks.login,
      {
        "email": email,
        "password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
