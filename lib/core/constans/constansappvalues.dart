import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppConstans {
  //////////logos////////////////////////
  static const String logodark = "images/logo + name 2  (2).png";
  static const String logolight = "images/logo + name 1.png";

  ///////////////////lottie//////////////
  static const String loadinglottie = "lottie/loading.json";
  static const String Search = "lottie/Animation - 1725188536955.json";

  /////////////////padding////////////////////

  static final double Hight = Get.height;
  static final double Width = Get.width;
  static final double PaddingHorizontal = Width * .02;
  static final double PaddingHorizontalAuth = Width * .04;
  static final double distanceapppar = Hight * .03;
  static final double Sizeboxsize = Hight * .03;
  static final double Radious = 16;

  //////////////////Loading Indicator////////////////////////////

  static final double IndicatorWidth = Width * .03;
  static final double IndicatorHight = Hight * .03;

  ///////////////////////////////////////Colors//////////////////////
  // static const Color MainColor = Color.fromARGB(255, 94, 141, 0);

  static const Color maincolordarktheme = Color.fromARGB(255, 172, 229, 56);
  static const Color maincolorlighttheme = Color.fromARGB(255, 139, 195, 25);
  static const Color nonenabledbuttomcolor = Color.fromARGB(105, 171, 229, 56);
  static const Color grey = Color.fromARGB(255, 144, 144, 144);
  static const Color blackcolor = Colors.black;
  // static const Color backgroundblackcolor = Color.fromARGB(255, 94, 141, 0);
  static const Color secondblackcolor = const Color.fromARGB(255, 30, 30, 31);
  static const Color Whitecolor = Color.fromARGB(255, 255, 255, 255);
  // static const Color themecolor = Color.fromARGB(255, 94, 141, 0);
  static const Color darkgreycolor = Color.fromARGB(255, 106, 103, 106);
  static const Color darkgreycolordarktheme =
      Color.fromARGB(255, 161, 161, 161);
  // static const Color SecondColor = Color.fromARGB(255, 1, 43, 65);
  static const Color IconColor = Colors.black;
  static const Color Bordercolor = Color.fromARGB(255, 227, 227, 227);
  static const Color ButtomColor = Color.fromARGB(255, 41, 71, 253);
//////////////////////////////////theme mode////////////////////

////////////////////////BACKEND///////////////////////////

  static const String contenttype = "application/json";

  static const String accepct = "application/json";

///////////////////////////boolen values////////////////
  static bool resizebutton = false;
}
