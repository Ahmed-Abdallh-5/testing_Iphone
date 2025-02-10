import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUPcontrolller extends GetxController {
  SigUP();
  Gotologin();
  Obsecuretextfunction2();
  Obsecuretextfunction();
}

class SignUPcontrollerimp extends SignUPcontrolller {
  SignUP signup = SignUP(Get.find());
  List data = [];
  StatueRequest? statueRequest;
  bool obsecuretext = true;
  bool obsecuretext2 = true;
  String errortextphone = "";
  String errortextemail = "";
  bool? iserroredtextemail = false;
  bool? iserroredtextphone = false;
  late TextEditingController Email;
  late TextEditingController Password;
  String passwordError = "";
  String text = "";
  late TextEditingController username;
  late TextEditingController phone;
  TextEditingController? confirmPassword;
  GlobalKey<FormState> formstatekey = GlobalKey<FormState>();
  bool ispasswordError = false;
  SigUP() async {
    if (formstatekey.currentState!.validate()) {
      // Check if password and confirmation password match
      if (Password.text == confirmPassword!.text) {
        // Send the sign-up request
        statueRequest = StatueRequest.loading;
        update();
        var response = await signup.Sendingdata(
          username.text,
          Email.text,
          phone.text,
          Password.text,
          confirmPassword!.text,
        );
        statueRequest = handlingdata(response);

        if (StatueRequest.Success == statueRequest) {
          if (response["message"] ==
              'User registered successfully, please verify your email') {
            Get.toNamed("/VertficationscreenSignUp",
                arguments: {"email": Email.text});
          } else {
            handleErrorResponse(response);
          }
        } else if (statueRequest == StatueRequest.ServerFaliure) {
          Get.defaultDialog(
            title: "306".tr,
            middleText: "307".tr,
          );
          update();
        } else if (statueRequest == StatueRequest.offline) {
          Get.defaultDialog(
            title: "306".tr,
            middleText: "308".tr,
          );
          update();
        }
      }
    }
  }

  void handleErrorResponse(Map response) {
    iserroredtextemail = false;
    iserroredtextphone = false;
    ispasswordError = false;

    if (response["errors"] != null) {
      Map errors = response["errors"];

      if (errors["email"] != null) {
        errortextemail = errors["email"].join(", ");
        iserroredtextemail = true;
      }

      if (errors["phone"] != null) {
        errortextphone = errors["phone"].join(", ");
        iserroredtextphone = true;
      }

      if (errors["password"] != null) {
        passwordError = errors["password"].join(", ");
        ispasswordError = true;
        print("Password error: $passwordError");
      }

      update(); // Update the UI after handling errors
    } else {
      // Handle case if the error format is different or unknown
      Get.defaultDialog(
        title: "Warning",
        middleText: "An unknown error occurred.",
      );
    }
  }

  Gotologin() {
    Get.offAllNamed("/loginsceen");
  }

  Obsecuretextfunction() {
    if (obsecuretext == true) {
      obsecuretext = false;
    } else {
      obsecuretext = true;
    }

    update();
  }

  Obsecuretextfunction2() {
    if (obsecuretext2 == true) {
      obsecuretext2 = false;
    } else {
      obsecuretext2 = true;
    }

    update();
  }

  @override
  void onInit() {
    Email = TextEditingController();
    Password = TextEditingController();
    username = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    Email.dispose();
    Password.dispose();
    username.dispose();
    confirmPassword!.dispose();
    phone.dispose();

    super.dispose();
  }
}
