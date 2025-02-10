import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';

class VertficationCodeSignUpsending {
  CRUD crud;
  VertficationCodeSignUpsending(this.crud);

  Sendingdata(
    String email,
    String OTP,
  ) async {
    var response =
        await crud.postdataAuthhandelingresponse(APPlinks.vertifycodelink, {
      "email": email,
      "otp": OTP,
    });

    return response.fold((l) => l, (r) => r);
  }
}
