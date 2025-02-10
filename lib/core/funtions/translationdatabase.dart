import 'package:ecommerce/core/services/settingservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

translationDataBase(ColumAR, ColumEN) {
  Settingservices settingservices = Get.find();

  if (settingservices.sharedPref.getString("lang") == "ar") {
    return ColumAR;
  } else {
    return ColumEN;
  }
}
