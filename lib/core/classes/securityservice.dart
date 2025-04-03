import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:ecommerce/controller/settingcon/settingscreen.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:freerasp/freerasp.dart';
import 'package:get/get.dart';

Settingscreenimble settingscreenimble = Get.put(Settingscreenimble());
Settingservices settingservices = Get.find();

class SecurityService {
  String convertSha256ToBase64(String hexHash) {
    hexHash = hexHash.replaceAll(':', '').replaceAll(' ', '');
    Uint8List bytes = Uint8List.fromList(List.generate(hexHash.length ~/ 2,
        (i) => int.parse(hexHash.substring(i * 2, i * 2 + 2), radix: 16)));
    return base64Encode(bytes);
  }

  static Future<void> initSecurityService() async {
    final config = TalsecConfig(
      androidConfig: AndroidConfig(
        packageName: 'com.example.ecommerce',
        signingCertHashes: ['fI+J4zr2sNYV6+OjiDZeLbmGB7JZOB5fbNxNqNTi6Ew='],
        supportedStores: [
          'com.android.vending',
          'com.sec.android.app.samsungapps',
          'com.huawei.appmarket'
        ],
      ),
      watcherMail: 'amedtarek499@gmail.com',
      isProd: false,
    );

    await Talsec.instance.start(config);
    Talsec.instance.attachListener(_threatCallback());
  }

  static ThreatCallback _threatCallback() {
    return ThreatCallback(
      onHooks: () {
        _handleSecurityThreat(
            "Unauthorized modifications detected! Logging out.",
            shouldExit: true,
            sholdtokendeleted: true);
      },
      onDebug: () {
        _handleSecurityThreat("Debug mode detected! User logged out.",
            shouldExit: true);
      },
      onAppIntegrity: () {
        _handleSecurityThreat(
            "App integrity check failed! Possible modification.",
            shouldExit: true,
            sholdtokendeleted: true);
      },
      onSimulator: () {
        _handleSecurityThreat(
            "App running on a simulator! Possible fraud attempt.",
            shouldExit: true,
            sholdtokendeleted: true);
      },
      onADBEnabled: () {
        _handleSecurityThreat("ADB access detected! User logged out.",
            shouldExit: true, sholdtokendeleted: true);
      },
      onDevMode: () {
        Get.snackbar(
          "Security Warning",
          "Developer mode is enabled! Consider disabling it.",
        );
      },
      onSystemVPN: () {
        Get.snackbar(
            "VPN Detected", "Using VPN may cause security restrictions.");
      },
      onUnofficialStore: () {
        _handleSecurityThreat("Unofficial store detected! App closing.",
            shouldExit: true, sholdtokendeleted: true);
      },
      onPrivilegedAccess: () {
        _handleSecurityThreat("Unauthorized access detected! App will close.",
            shouldExit: true, sholdtokendeleted: true);
      },
      onDeviceBinding: () {
        _handleSecurityThreat("Device binding issue detected! User logged out.",
            shouldExit: true, sholdtokendeleted: true);
      },
      onObfuscationIssues: () {
        Get.snackbar("Security Warning",
            "App security issues detected! Consider updating.");
      },
    );
  }

  static void _handleSecurityThreat(String message,
      {bool shouldExit = false, bool sholdtokendeleted = false}) {
    // حذف التوكن (إذا كنت تستخدم تخزين آمن مثل shared_preferences أو secure_storage)

    // عرض رسالة تحذيرية
    Get.snackbar("Security Alert", message);

    // تسجيل خروج المستخدم
    settingscreenimble.logout();
    if (sholdtokendeleted) {
      // settingservices.storage.deleteAll();
    }

    // إغلاق التطبيق إذا لزم الأمر
    if (shouldExit) {
      Future.delayed(Duration(seconds: 2), () {
        exit(0);
      });
    }
  }
}

// ملاحظة: تأكد من تنفيذ LoginScreen() وتخزين التوكن بشكل آمن في SecureStorage أو SharedPreferences
