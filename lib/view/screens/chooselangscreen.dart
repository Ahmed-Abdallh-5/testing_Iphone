import 'package:ecommerce/controller/chosselang/langcontroller.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/langbutoom.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chooselangscreen extends StatelessWidget {
  const chooselangscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    langcontroller controller = Get.find();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1".tr,
            style: TextStyleClass.getTextStyle("Bold", AppConstans.Width / 15),
          ),
          SizedBox(
            height: AppConstans.Hight * .005,
          ),
          langbuttom(
            onpresslnagchangen: () {
              controller.changelang("ar");
              settingservices.sharedPref.setString("chosenlanguage", "2".tr);
              Get.offAllNamed("/onbordscreen");
            },
            langname: "2".tr,
          ),
          SizedBox(
            height: AppConstans.Hight * .015,
          ),
          langbuttom(
            onpresslnagchangen: () {
              controller.changelang("en");
              settingservices.sharedPref.setString("chosenlanguage", "3".tr);
              Get.offAllNamed("/onbordscreen");
            },
            langname: "3".tr,
          )
        ],
      ),
    );
  }
}
