import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/screens/langscreen/chooselangscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      backgroundColor: Get.isDarkMode == true
          ? Color.fromARGB(255, 21, 21, 21)
          : AppConstans.Whitecolor,
      duration: 3000,
      splashIconSize: AppConstans.Width / 1.6,
      splash: Image.asset(
        Get.isDarkMode == true ? AppConstans.logodark : AppConstans.logolight,
        // height: AppConstans.Hight,
        // width: AppConstans.Width,
      ),
      nextScreen: chooselangscreen(),
      splashTransition: SplashTransition.slideTransition,
      centered: true,
    ));
  }
}
