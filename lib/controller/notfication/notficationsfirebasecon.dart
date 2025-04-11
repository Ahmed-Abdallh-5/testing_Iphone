// import 'dart:developer';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';

// class PushNotificationsService extends GetxController {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   Settingservices settingservices = Get.put(Settingservices());
//   Future<void> init() async {
//     // Request permission from the user
//     await messaging.requestPermission();

//     // Check if permission is granted

//     log('User granted permission');
//     settingservices.sharedPref.setBool("notficationperm", true);
//     // Subscribe to topic only if permission is granted
//     messaging.subscribeToTopic('news').then((Value) {
//       log('Subscribed to topic: all');
//     });
//   }
//   // Optional: Get and send token to the server
//   // String? token = await messaging.getToken();
//   // if (token != null) {
//   //   log('FCM Token: $token');
//   //   sendTokenToServer(token);
//   // }

//   // Handle token refresh
//   //     messaging.onTokenRefresh.listen((newToken) {
//   //       sendTokenToServer(newToken);
//   //     });
//   //   } else {
//   //     log('User denied permission');
//   //   }
//   // }

//   // static void sendTokenToServer(String token) {
//   //   // Implement your logic to send token to your backend
//   //   log('Token sent to server: $token');
//   // }

//   // NotficationsOn() async {
//   //   if (settingservices.sharedPref.getBool("notficationperm") == false) {
//   //     NotificationSettings settings = await messaging.requestPermission();
//   //     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//   //       log('User granted permission');
//   //       settingservices.sharedPref.setBool("notficationperm", true);
//   //       // Subscribe to topic only if permission is granted
//   //       messaging.subscribeToTopic('news').then((_) {
//   //         log('Subscribed to topic: all');
//   //       });
//   //     }
//   //     messaging.subscribeToTopic('news').then((_) {
//   //       log('Subscribed to topic: all');
//   //     });
//   //   } else {
//   //     messaging.subscribeToTopic('news').then((_) {
//   //       log('Subscribed to topic: all');
//   //     });
//   //   }
//   // }

//   // NotficationsOff() async {
//   //   // NotificationSettings settings = await messaging.requestPermission();

//   //   messaging.unsubscribeFromTopic('news').then((_) {
//   //     settingservices.sharedPref.setBool("notficationperm", false);
//   //     log('Subscribed to topic: all');
//   //   });
//   // }
// }
