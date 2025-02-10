import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verficationcoderesetpass.dart';

import 'package:get/get.dart';

abstract class VerficationSettingPageCon extends GetxController {
  void confirmCode(String verificationCode);
}

class VerficationSettingPageConimple extends VerficationSettingPageCon {
  late String vertficationcode;
  String? Email;
  ForgetPasswordVertdicationCode vertifyp =
      ForgetPasswordVertdicationCode(Get.find());

  StatueRequest? statueRequest;
  void confirmCode(String verificationCode) async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await vertifyp.Sendingdata(verificationCode, Email!);
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);

      if (response["message"] == 'OTP has been verified successfully.') {
        Get.offNamed("/resetpasswordSettingScreen",
            arguments: {"email": Email});
      }
    } else if (statueRequest == StatueRequest.authproblem) {
      Get.defaultDialog(title: "57".tr, middleText: "58".tr);
    } else if (statueRequest == StatueRequest.offline) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "No internet connection. Please check your internet.",
      );
    } else if (statueRequest == StatueRequest.ServerFaliure) {
      Get.defaultDialog(title: "57".tr, middleText: "58".tr);
    }
    update();
  }

  @override
  void onInit() {
    Email = Get.arguments['email'];

    super.onInit();
  }
}
