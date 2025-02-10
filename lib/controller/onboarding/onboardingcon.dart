import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';

abstract class OnboardingCon extends GetxController {
  changeindex(int value);
  gotologinscreen();
  gotosignup();
}

class OnboardingConimble extends OnboardingCon {
  Settingservices settingservices = Get.find();
  int index = 0;
  @override
  changeindex(int value) {
    index = value;
    update();
  }

  @override
  gotologinscreen() {
    settingservices.sharedPref.setString("Step", "1");
    Get.offAllNamed("/loginsceen");
  }

  @override
  gotosignup() {
    Get.offAllNamed("/signup");
  }

  @override
  void onInit() {
    super.onInit();
  }
}
