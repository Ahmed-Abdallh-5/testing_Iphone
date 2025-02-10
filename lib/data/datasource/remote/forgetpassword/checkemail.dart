import 'package:ecommerce/core/classes/crud.dart';

import 'package:ecommerce/core/constans/links/links.dart';

class CheckEmail {
  CRUD crud;
  CheckEmail(this.crud);

  Sendingdata(
    String email,
  ) async {
    var response = await crud
        .postdataAuthhandelingresponse(APPlinks.checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
