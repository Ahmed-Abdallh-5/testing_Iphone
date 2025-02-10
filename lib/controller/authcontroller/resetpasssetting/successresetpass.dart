import 'package:get/get.dart';

abstract class SuccessResetPswwordSettingPageCon extends GetxController {
  GoTOHome();
}

class SuccessResetPswwordSettingPageConimpl
    extends SuccessResetPswwordSettingPageCon {
  GoTOHome() {
    Get.offAllNamed("/homeScreen");
  }
}
