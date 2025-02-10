import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordSettingPage extends GetxController {
  void ConfirmEmail();

  void settingpage();
}

class ForgetpasswordSettingPageimple extends ForgetpasswordSettingPage {
  CheckEmail checkEmail = CheckEmail(Get.find());
  late TextEditingController email;
  GlobalKey<FormState> keyow = GlobalKey<FormState>();

  StatueRequest? statueRequest;

  ConfirmEmail() async {
    if (keyow.currentState!.validate()) {
      statueRequest = StatueRequest.loading;
      update();
      var response = await checkEmail.Sendingdata(
        email.text,
      );
      statueRequest = handlingdata(response);
      if (StatueRequest.Success == statueRequest) {
        print(response);

        if (response["message"] == 'OTP has been generated successfully.') {
          Get.offNamed("/vertficodeSettingPage",
              arguments: {"email": email.text});
        }
      } else if (StatueRequest.offline == statueRequest) {
        Get.defaultDialog(
          title: "Warning",
          middleText: "No internet connection. Please check your internet.",
        );
      } else if (StatueRequest.ServerFaliure == statueRequest) {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email isn't exsist.",
        );
      }
      update();
    }
  }

  settingpage() {
    Get.back();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
