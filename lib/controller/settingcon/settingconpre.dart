// import 'package:ecommerce/controller/settingcon/changelanguagesettingpage.dart';
// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/classes/workmanger.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/core/funtions/notfications.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/data/datasource/remote/settings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:workmanager/workmanager.dart';

// abstract class SettingscreenCon extends GetxController {
//   bool ChangeSwitcherButtonDarkLight(bool IsSwitched);
//   void SwitchDarkMode(BuildContext context);
//   bool ChangeSwitcherButtonNotfications(bool newSwitchedNotiyValue);
//   ChangeingLanguage(String text);
//   GoToEditprofile();
//   notficationSwitcher(bool newval);
//   Gotochangecountry();
// }

// class Settingscreenimble extends SettingscreenCon {
//   Setting setting = Setting(Get.find());
//   StatueRequest? statueRequest;
//   bool IsSwitched = false;
//   bool IsSwitchedNotfications = true;
//   List<String> langlist = ["English", "Arabic"];
//   List<String> langlistarabic = ["العربية", "الأنجليزية"];
//   Settingservices settingservices = Get.find();
//   LangcontrollerSettingPage langcontrollerSettingPage =
//       Get.put(LangcontrollerSettingPage());
//   @override
//   GoToEditResetPaswword() {
//     Get.toNamed("/checkMailScreen");
//   }

//   GoToDeleteaccount() {
//     Get.toNamed("/deleteAccountScreen");
//   }

//   GoToEditprofile() {
//     Get.toNamed("/editprofilescreen");
//   }

//   Gotochangecountry() {
//     Get.toNamed("/changeCounteyscreen");
//   }

//   ChangeingLanguage(text) {
//     if (text == "en") {
//       langcontrollerSettingPage.changelang("en");
//       update();
//       Get.back();
//     } else {
//       langcontrollerSettingPage.changelang("ar");
//       update();
//       Get.back();
//     }
//   }

//   @override
//   bool ChangeSwitcherButtonDarkLight(bool newIsSwitched) {
//     IsSwitched = newIsSwitched;

//     settingservices.sharedPref.setBool("IsSwitched", newIsSwitched);
//     update();
//     return IsSwitched;
//   }

//   @override
//   void SwitchDarkMode(BuildContext context) {
//     if (settingservices.sharedPref.getBool("IsSwitched") == false ||
//         settingservices.sharedPref.getBool("IsSwitched") == null ||
//         Theme.of(context).brightness == Brightness.dark) {
//       Get.changeTheme(ThemeData.light());
//     } else {
//       Get.changeTheme(ThemeData.dark());
//     }
//     update();
//   }

//   logout() async {
//     statueRequest = StatueRequest.loading;
//     update();
//     var response = await setting.Logout();
//     statueRequest = handlingdata(response);
//     if (StatueRequest.Success == statueRequest) {
//       print(response);
//       if (response['message'] == 'Logged out successfully') {
//         Get.offAndToNamed('/loginsceen');
//       }
//     } else {
//       statueRequest = StatueRequest.ServerFaliure;
//     }
//   }

//   @override
//   bool ChangeSwitcherButtonNotfications(bool newSwitchedNotiyValue) {
//     IsSwitchedNotfications = newSwitchedNotiyValue;
//     settingservices.sharedPref
//         .setBool("IsSwitchedNotficationss", newSwitchedNotiyValue);
//     update();
//     return IsSwitchedNotfications;
//   }

//   @override
//   notficationSwitcher(bool newval) {
//     IsSwitchedNotfications = newval;

//     settingservices.sharedPref.setBool("$IsSwitchedNotfications", newval);
//     update();
//   }

//   @override
//   notficationSwitcherFunction(bool newval, String uniqueName) async {
//     IsSwitchedNotfications = newval;
//     settingservices.sharedPref.setBool("$IsSwitchedNotfications", newval);

//     if (IsSwitchedNotfications == true) {
//       await registertask();
//     } else if (IsSwitchedNotfications == false) {
//       print(IsSwitchedNotfications);

//       WorkMangerClass().cancelAll(uniqueName);
//       // Notfications().CancelNotfication();
//     }

//     update();
//   }

//   @override
//   void onInit() {
//     settingservices.sharedPref.setBool("$IsSwitchedNotfications", true);
//     super.onInit();
//   }
// }
