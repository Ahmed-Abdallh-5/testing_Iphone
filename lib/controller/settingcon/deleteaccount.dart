import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/setting/settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DeleteAccount extends GetxController {
  // void Delete();

  Obsecuretextfunction();
}

class DeleteAccountimple extends DeleteAccount {
  late TextEditingController password;
  bool obsecuretext = true;
  StatueRequest? statueRequest;
  SettingFunction setting = SettingFunction(Get.find());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Settingservices settingservices = Get.find();
  void Delete() async {
    if (formkey.currentState!.validate()) {
      statueRequest = StatueRequest.loading;
      update();
      var response = await setting.Deletefun(
        password.text,
      );
      statueRequest = handlingdata(response);
      if (StatueRequest.deletedsuccess == statueRequest) {
        print("response");

        await settingservices.storage.deleteAll();

        // settingservices.sharedPref.clear();
        Get.offAndToNamed('/chooselangscreen');
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

    // Get.offAllNamed("/SuccesResetPassWord");
  }

  Obsecuretextfunction() {
    if (obsecuretext == true) {
      obsecuretext = false;
    } else {
      obsecuretext = true;
    }

    update();
  }

  @override
  void onInit() {
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }
}
