import 'package:ecommerce/firebase_options.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class Settingservices extends GetxService {
  late SharedPreferences sharedPref;
  // final storage = FlutterSecureStorage();
  Future<Settingservices> intial() async {
    sharedPref = await SharedPreferences.getInstance();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // await SecurityService.initSecurityService();
    await initializeDateFormatting('ar', null);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // await messaging.getToken().then((value) {});
    // messaging.onTokenRefresh.listen((value) {});
    return this;
  }
}

Future<void> intialservices() async {
  await Get.putAsync(() => Settingservices().intial());
}
