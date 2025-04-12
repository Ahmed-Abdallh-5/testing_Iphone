import 'package:ecommerce/controller/onboarding/onboardingcon.dart';
import 'package:ecommerce/controller/settingcon/changelanguagesettingpage.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/classes/workmanger.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/setting/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class SettingscreenCon extends GetxController {
  bool ChangeSwitcherButtonDarkLight(bool IsSwitched);
  void SwitchDarkMode(BuildContext context);
  // bool ChangeSwitcherButtonNotfications(bool newSwitchedNotiyValue);
  ChangeingLanguage();
  GoToEditprofile();
  // notficationSwitcher(bool newval);
  Gotochangecountry();
}

class Settingscreenimble extends SettingscreenCon {
  SettingFunction setting = SettingFunction(Get.find());
  StatueRequest? statueRequest;
  bool IsSwitched = false;
  bool? IsSwitchedNotfications;
  List<String> langlist = ["English", "Arabic"];
  List<String> langlistarabic = ["العربية", "الأنجليزية"];
  Settingservices settingservices = Get.find();
  LangcontrollerSettingPage langcontrollerSettingPage =
      Get.put(LangcontrollerSettingPage());
  @override
  GoToEditResetPaswword() {
    Get.toNamed("/forgetpassword");
  }

  GoToDeleteaccount() {
    Get.toNamed("/deleteAccountScreen");
  }

  GoToEditprofile() {
    Get.toNamed("/editProfleScreen");
  }

  Gotochangecountry() {
    Get.toNamed("/choosecountryscreen");
  }

  ChangeingLanguage() {
    if (settingservices.sharedPref.getString("lang") == "ar") {
      langcontrollerSettingPage.changelang("en");
      update();
      Get.back();
    } else {
      langcontrollerSettingPage.changelang("ar");
      update();
      Get.back();
    }
  }

  @override
  bool ChangeSwitcherButtonDarkLight(bool newIsSwitched) {
    IsSwitched = newIsSwitched;

    settingservices.sharedPref.setBool("IsSwitched", newIsSwitched);
    update();
    return IsSwitched;
  }

  @override
  @override
  void SwitchDarkMode(BuildContext context) {
    bool isDarkMode = settingservices.sharedPref.getBool("IsSwitched") ?? false;

    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  logout() async {
    statueRequest = StatueRequest.loading;
    update();
    var response = await setting.Logout();
    statueRequest = handlingdata(response);
    if (StatueRequest.Success == statueRequest) {
      print(response);
      if (response['message'] == 'User logged out successfully') {
        Get.offAndToNamed('/loginsceen');
      }
    } else {
      statueRequest = StatueRequest.ServerFaliure;
    }
  }

  @override
  // bool ChangeSwitcherButtonNotfications(bool newSwitchedNotiyValue) {
  //   IsSwitchedNotfications = newSwitchedNotiyValue;
  //   settingservices.sharedPref
  //       .setBool("IsSwitchedNotficationss", newSwitchedNotiyValue);
  //   update();
  //   return IsSwitchedNotfications!;
  // }

  @override
  // notficationSwitcher(bool newval) {
  //   IsSwitchedNotfications = newval;

  //   settingservices.sharedPref.setBool("$IsSwitchedNotfications", newval);
  //   update();
  // }

  notficationSwitcherFunction(bool newVal, String uniqueName) async {
    IsSwitchedNotfications = newVal;

    if (IsSwitchedNotfications!) {
      // Ask for permission first
      PermissionStatus status = await Permission.notification.request();

      if (status.isGranted) {
        await registertask();
        settingservices.sharedPref.setBool("IsSwitchedNotficationss", true);
        IsSwitchedNotfications = true;
      } else {
        // User denied permission, switch back off
        settingservices.sharedPref.setBool("IsSwitchedNotficationss", false);
        IsSwitchedNotfications = false;
      }
    } else {
      // الحالة: المستخدم لغى تفعيل الإشعارات
      settingservices.sharedPref.setBool("IsSwitchedNotficationss", false);
      await WorkMangerClass().cancelAll(uniqueName);
      IsSwitchedNotfications = false;
    }

    print(IsSwitchedNotfications);
    update();
  }

  @override
  void onInit() {
    IsSwitchedNotfications =
        settingservices.sharedPref.getBool("IsSwitchedNotficationss");
    print(IsSwitchedNotfications);
    super.onInit();
  }
}
