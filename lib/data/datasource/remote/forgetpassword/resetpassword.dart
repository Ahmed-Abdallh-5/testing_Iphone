import 'package:ecommerce/core/classes/crud.dart';
import 'package:ecommerce/core/constans/links/links.dart';

class ResetPassword {
  CRUD crud;
  ResetPassword(this.crud);

  Sendingdata(
    String email,
    String password,
    String passwordCon,
    String Otp,
  ) async {
    var response =
        await crud.patchDataAuthHandlingResponse(APPlinks.resetpassword, {
      "email": email,
      "password": password,
      'otp': Otp,
      'password_confirmation': passwordCon,
    });
    return response.fold((l) => l, (r) => r);
  }
}
