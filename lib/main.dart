import 'package:ecommerce/bindings/mybindings.dart';
import 'package:ecommerce/controller/choosecountry/choosecountrycont.dart';
import 'package:ecommerce/controller/chosselang/langcontroller.dart';
import 'package:ecommerce/core/constans/pages/pages.dart';
import 'package:ecommerce/core/constans/themedata.dart';
import 'package:ecommerce/core/localization/translatons.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/auth/login/login.dart';
import 'package:ecommerce/view/screens/account/accountscreennew.dart';
import 'package:ecommerce/view/screens/account/editprofile.dart';
import 'package:ecommerce/view/screens/authscreens/signupsceens/vertfiycodesignup.dart';
import 'package:ecommerce/view/screens/checkout/checkout.dart';
import 'package:ecommerce/view/screens/chooselangscreen.dart';
import 'package:ecommerce/view/screens/homescreens/homescreen.dart';
import 'package:ecommerce/view/screens/mymatches/mymatchesscreen.dart';
import 'package:ecommerce/view/screens/onboarding/onboardingscreen.dart';
import 'package:ecommerce/view/screens/rewiewpages.dart';
import 'package:ecommerce/view/screens/settingscreens/aboutus.dart';
import 'package:ecommerce/view/screens/authscreens/login/login.dart';
import 'package:ecommerce/view/screens/authscreens/signupsceens/successsignnup.dart';
import 'package:ecommerce/view/screens/choosecountryscreens/choosecountryscreen.dart';
import 'package:ecommerce/view/screens/listtrial.dart';
import 'package:ecommerce/view/screens/settingscreens/privacyscreen.dart';
import 'package:ecommerce/view/screens/settingscreens/settingscreen.dart';
import 'package:ecommerce/view/screens/settingscreens/termsandconditions.dart';
import 'package:ecommerce/view/screens/spalshscreen/splashscreen.dart';
import 'package:ecommerce/view/screens/timerscreen.dart';
import 'package:ecommerce/view/screens/tournment/tournament.dart';
import 'package:ecommerce/view/screens/viewallscreens/viewallitemscreen.dart';
import 'package:ecommerce/view/screens/tournment/tournmentscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.put(Settingservices()).intial();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    langcontroller controller = Get.put(langcontroller());
    return GetMaterialApp(
        // showPerformanceOverlay: true,

        // home: SplashScreen(),
        // theme: ThemeData.dark(), // Set light theme
        darkTheme: customDarkTheme,
        themeMode: settingservices.sharedPref.getBool("IsSwitched") == true
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        translations: localizations(),
        initialBinding: MyBindings(),
        locale: controller.langauge,
        getPages: pages);
  }
}
