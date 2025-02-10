import 'package:ecommerce/core/services/settingservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class Mymiddlware extends GetMiddleware {
  int? get Priority => 1;

  RouteSettings? redirect(String? route) {
    Settingservices settingservices = Get.find();

    if (settingservices.sharedPref.getString("Step") == "1") {
      return RouteSettings(name: "/loginsceen");
    }
    if (settingservices.sharedPref.getString("Step") == "2") {
      return RouteSettings(name: "/homeScreen");
    }
  }
}
