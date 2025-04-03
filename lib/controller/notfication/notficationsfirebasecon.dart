import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    // Request permission from the user
    NotificationSettings settings = await messaging.requestPermission();

    // Check if permission is granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');

      // Subscribe to topic only if permission is granted
      messaging.subscribeToTopic('all').then((_) {
        log('Subscribed to topic: all');
      });

      // Optional: Get and send token to the server
      String? token = await messaging.getToken();
      if (token != null) {
        log('FCM Token: $token');
        sendTokenToServer(token);
      }

      // Handle token refresh
      messaging.onTokenRefresh.listen((newToken) {
        sendTokenToServer(newToken);
      });
    } else {
      log('User denied permission');
    }
  }

  static void sendTokenToServer(String token) {
    // Implement your logic to send token to your backend
    log('Token sent to server: $token');
  }

  NotficationsOn() async {
    // NotificationSettings settings = await messaging.requestPermission();

    messaging.subscribeToTopic('all').then((_) {
      log('Subscribed to topic: all');
    });
  }

  NotficationsOff() async {
    // NotificationSettings settings = await messaging.requestPermission();

    messaging.unsubscribeFromTopic('all').then((_) {
      log('Subscribed to topic: all');
    });
  }
}
