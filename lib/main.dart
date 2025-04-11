import 'package:ecommerce/bindings/mybindings.dart';
import 'package:ecommerce/controller/chosselang/langcontroller.dart';
import 'package:ecommerce/core/constans/pages/pages.dart';
import 'package:ecommerce/core/constans/themedata.dart';
import 'package:ecommerce/core/localization/translatons.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      builder: (context, child) => GetMaterialApp(
          // home: SplashScreen(),
          // theme: customDarkTheme,
          darkTheme: customDarkTheme,
          themeMode: settingservices.sharedPref.getBool("IsSwitched") == true
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          translations: localizations(),
          initialBinding: MyBindings(),
          locale: controller.langauge,
          getPages: pages),
    );
  }
}
