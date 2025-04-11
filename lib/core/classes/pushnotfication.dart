import 'dart:developer';
import 'package:ecommerce/core/funtions/checkinternet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  // Instance of FirebaseMessaging
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// Initializes push notification service
  static Future<void> init() async {
    // Ensure permissions are requested (especially for iOS)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    // Get and send FCM token if internet is available
    bool hasInternet = await checkinternet();
    if (hasInternet) {
      try {
        String? token = await messaging.getToken();
        if (token != null) {
          log('FCM Token: $token');
          sendTokenToServer(token);
        }
      } catch (e) {
        log('Error getting FCM token: $e');
      }

      // Listen to token refresh
      messaging.onTokenRefresh.listen((newToken) {
        log('FCM Token refreshed: $newToken');
        sendTokenToServer(newToken);
      });
    } else {
      log('No internet connection. Cannot get FCM token.');
    }

    // Subscribe to a topic
    try {
      await messaging.subscribeToTopic('news');
      log('Subscribed to topic: all');
    } catch (e) {
      log('Subscription to topic failed: $e');
    }

    // Setup background message handler
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Optionally: listen to foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Foreground message received: ${message.notification?.title ?? 'No Title'}');
    });

    // Optionally: handle message opened from terminated state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Notification clicked (app opened): ${message.notification?.title ?? 'No Title'}');
    });
  }

  /// Handles background messages
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log('Background message received: ${message.notification?.title ?? 'No Title'}');
  }

  /// Sends FCM token to server or database
  static void sendTokenToServer(String token) {
    // TODO: Send token via API or save it in Firebase
    log('Token sent to server: $token');
  }
}
