import 'dart:developer';
import 'package:ecommerce/core/funtions/checkinternet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    // print("fcm token issssss");
    await messaging.requestPermission();

    // if (checkinternet()) {
    //   await messaging.getToken().then((value) {
    //     print(value);
    //     sendTokenToServer(value!);
    //   });

    //   messaging.onTokenRefresh.listen((value) {
    //     sendTokenToServer(value);
    //   });
    // } else {}

    // FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    // //foreground

    // messaging.subscribeToTopic('all').then((val) {
    //   log('sub');
    // });

    // messaging.unsubscribeFromTopic('all');
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void sendTokenToServer(String token) {
    // option 1 => API
    // option 2 => Firebase
  }
}
