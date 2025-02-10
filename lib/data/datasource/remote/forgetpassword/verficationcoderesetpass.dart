import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';

class ForgetPasswordVertdicationCode {
  CRUD crud;
  ForgetPasswordVertdicationCode(this.crud);

  Sendingdata(
    String email,
    String OTP,
  ) async {
    var response = await crud
        .postdataAuthhandelingresponse(APPlinks.resetpasswordvertifycode, {
      "email": email,
      "otp": OTP,
    });
    return response.fold((l) => l, (r) => r);
  }
}
