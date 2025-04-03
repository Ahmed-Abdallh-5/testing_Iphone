import 'package:ecommerce/view/screens/account/accountscreennew.dart';
import 'package:ecommerce/view/screens/homescreens/home2.dart';
import 'package:ecommerce/view/screens/mymatches/mymatchesscreen.dart';
import 'package:ecommerce/view/screens/tournment/tournmentscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ButtomNavBarController extends GetxController {
  changepage(int pagenumber);
}

class ButtomNavBarControllerime extends ButtomNavBarController {
  List<Widget> pages = [
    Home12(),
    // MyAccountScreen(),
    // SettingScreeneScreen(),
    // SettingScreeneScreen(),
    TournmentScreen(),
    MyMatchesScreen(),
    // MyBookingScreen(),
    MyAccountScreen(),
  ];

  bool? isactive = false;
  int pagenumber = 0;
  @override
  changepage(int i) {
    pagenumber = i;
    update();
  }
}
