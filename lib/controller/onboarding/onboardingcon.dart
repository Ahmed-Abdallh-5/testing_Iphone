import 'package:ecommerce/core/classes/pushnotfication.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class OnboardingCon extends GetxController {
  changeindex(int value);
  gotologinscreen();
  gotosignup();
}

class OnboardingConimble extends OnboardingCon {
  Settingservices settingservices = Get.find();
  var status;
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
  void onInit() async {
    await Permission.notification.request();

    status = await Permission.notification.status;
    print(status);
    //  var status = await Permission.notification.status;
    if (status == Permission.notification.status.isGranted) {
      settingservices.sharedPref.setBool("IsSwitchedNotficationss", true);
    }
    // } else if (status == Permission.notification.status.isDenied) {
    //   settingservices.sharedPref.setBool("IsSwitchedNotficationss", false);
    // }
    else {
      settingservices.sharedPref.setBool("IsSwitchedNotficationss", false);
    }
    print(settingservices.sharedPref.getBool("IsSwitchedNotficationss"));
    // else if (status.isPermanentlyDenied) {
    //   await openAppSettings();
    // }
    // PushNotificationsService.init();
    super.onInit();
  }
}
