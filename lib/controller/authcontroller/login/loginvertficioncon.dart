import 'dart:async';

import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/links/links.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/auth/login/vertficationlogin.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup/resendcode.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup/vertfication.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

abstract class VerficationControllerLogin extends GetxController {
  void confirmCode(String verificationCode);
  void ResendCode();
  // void GOtoSuccessSIGNUP();
  // void backtosignup();
}

class VerficationControllerLoginimple extends VerficationControllerLogin {
  late Timer _timer;
  // final storage = new FlutterSecureStorage();
  bool isbuttomenable = true;
  String errormessage = "";
  String? email;
  VertficationCodeLogin vertifyp = VertficationCodeLogin(Get.find());
  bool enable = false;
  String? verificationCode;
  StatueRequest? statueRequest;
  int timersecomds = 30;
  Settingservices settingservices = Get.find();
  ResendVertficationCode resendVertficationCode =
      ResendVertficationCode(Get.find());
  void confirmCode(verificationCode) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await vertifyp.Sendingdata(email!, verificationCode);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);

      if (response["message"] == 'User authenticated successfully') {
        settingservices.sharedPref
            .setString("username", response['data']['name']);
        settingservices.sharedPref
            .setString("useremail", response['data']['email']);
        settingservices.sharedPref
            .setString("phone", response['data']['phone']);
        settingservices.sharedPref.setInt("userid", response['data']['id']);
        // settingservices.sharedPref.setString("token", response['token']);
        settingservices.sharedPref.setString("version", response['version']);
        settingservices.sharedPref.setString(
            'photo', "${APPlinks.domain}" + response['data']['photo']);
        token:
        await settingservices.sharedPref.getString("token");

        Get.offAndToNamed("/choosecountryscreen");
        update();
      } else {
        Get.defaultDialog(middleText: response["message"], title: "311".tr);
        enable = false;
      }
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "308".tr,
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(
        title: "311".tr,
        middleText: "307".tr,
      );
    }
    update();
  }

  void ResendCode() async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await resendVertficationCode.Resenddata(email!);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);

      if (response["message"] == "We've sent a new OTP to you") {
      } else {
        Get.defaultDialog(middleText: response["message"], title: "311".tr);
      }
    }
    // } else if (response["message"] == 'message') {
    //   Get.defaultDialog(
    //     title: "57".tr,
    //   );
    // }
    update();
  }

  void Timerfunc() {
    if (isbuttomenable) {
      isbuttomenable = false; // Disable the button immediately
      update(); // Notify UI to disable button

      // Start the 30-second countdown timer
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (timersecomds > 0) {
          timersecomds--; // Decrement the timer seconds
          update();
          print(timersecomds);
        } else {
          // Once the countdown reaches zero
          _timer.cancel(); // Stop the timer
          isbuttomenable = true; // Re-enable the button
          timersecomds = 30; // Reset the countdown
          print("Timer ended. Button re-enabled.");
          update(); // Notify UI after re-enabling the button
        }
        update(); // Notify UI on each tick of the timer
      });
    }
  }

  void updateVerificationCode(String code) {
    verificationCode = code;
    enable = code.length == 5; // Enable button if OTP has 5 digits
    update(); // Notify GetBuilder to rebuild the UI
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
