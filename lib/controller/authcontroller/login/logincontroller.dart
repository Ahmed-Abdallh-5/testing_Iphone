import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/funtions/checkinternet.dart';
import 'package:ecommerce/core/funtions/handlingdata.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/datasource/remote/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

abstract class Logincontrolller extends GetxController {
  login();
  GotoSignUP();
  signInWithGoogle();
  GOTOForgetpassword();
  Obsecuretextfunction();
}

class Logincontrollerimp extends Logincontrolller {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    serverClientId:
        '832425898824-ank3jnfr7knqonr1t5gn6iann8hkvbl0.apps.googleusercontent.com', // ضع Client ID الذي نسخته
  );
  final formKeylogin = GlobalKey<FormState>();
  // final storage = new FlutterSecureStorage();
  var status;
  late TextEditingController email;
  late TextEditingController Password;
  bool obsecuretext = true;
  bool iserroredtextemail = false;
  bool errortextpassword = false;
  String errortextemail = "";
  String passwordError = "";
  Login loginfun = Login(Get.find());
  StatueRequest? statueRequest;
  Settingservices settingservices = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  login() async {
    if (formKeylogin.currentState!.validate()) {
      // Send the sign-up request
      statueRequest = StatueRequest.loading;
      update();

      var response = await loginfun.Sendingdata(
        email.text,
        Password.text,
      );

      statueRequest = handlingdata(response);

      if (StatueRequest.Success == statueRequest) {
        if (response["message"] == 'User authenticated successfully') {
          String rawPhotoLink = response['data']['photo'];
          String correctedPhotoLink =
              rawPhotoLink.replaceFirst('http://192.168.1.2/api', '');

          settingservices.sharedPref
              .setString("username", response['data']['name']);
          settingservices.sharedPref.setString("photo", correctedPhotoLink);
          settingservices.sharedPref
              .setString("useremail", response['data']['email']);
          // da
          // settingservices.sharedPref
          //     .setString("phone", response['data']['phone']);
          settingservices.sharedPref.setInt("userid", response['data']['id']);
          settingservices.sharedPref.setString("version", response['version']);
          settingservices.sharedPref.setString("token", response['token']);
          // await settingservices.storagegit init
          //     .write(key: "token", value: response['token']);

          Get.offAndToNamed("/choosecountryscreen");
        } else if (response["message"] ==
            "This Email is not verified yet, We've sent a OTP to you") {
          Get.toNamed("/vertficationscreenLogin",
              arguments: {"email": email.text});
        } else {
          handleErrorResponse(response);
        }
      } else if (statueRequest == StatueRequest.offline) {
        Get.defaultDialog(
          title: "311".tr,
          middleText: "308".tr,
        );
      } else if (statueRequest == StatueRequest.ServerFaliure) {
        Get.defaultDialog(
          title: "311".tr,
          middleText: "307".tr,
        );
      }

      update();
    }
  }

  void handleErrorResponse(Map response) {
    iserroredtextemail = false;
    errortextpassword = false;
    // ispasswordError = false;

    if (response["errors"] != null) {
      Map errors = response["errors"];

      if (errors["email"] != null) {
        errortextemail = errors["email"].join(", ");
        iserroredtextemail = true;
      }

      if (errors["password"] != null) {
        passwordError = errors["password"].join(", ");
        errortextpassword = true;
        print("Password error: $passwordError");
      }

      update(); // Update the UI after handling errors
    } else {
      // Handle case if the error format is different or unknown
      Get.defaultDialog(
        title: "Warning",
        middleText: "An unknown error occurred.",
      );
    }
  }

  Obsecuretextfunction() {
    if (obsecuretext == true) {
      obsecuretext = false;
    } else {
      obsecuretext = true;
    }

    update();
  }

  GotoSignUP() {
    Get.offAllNamed("/signup");
  }

  GOTOForgetpassword() {
    Get.toNamed("/forgetpassword");
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  @override
  Future logout() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print("User successfully logged out.");
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  Future signInWithGoogle() async {
    // Ensure checkinternet is awaited
    if (await checkinternet()) {
      try {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth == null) {
          print(
              "Google Authentication failed, ID token or Access Token is null.");
          return;
        }

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Store the access token
        settingservices.sharedPref
            .setString("accessToken", googleAuth.accessToken!);

        // Sign in with Firebase
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        String? idToken =
            await _auth.currentUser!.getIdToken(); // Retrieve the ID token
        var response = await loginfun.SendingdataGoogle(idToken);
        statueRequest = handlingdata(response);

        if (StatueRequest.Success == statueRequest) {
          if (response["message"] == 'User authenticated successfully') {
            String rawPhotoLink = response['data']['photo'];
            String correctedPhotoLink =
                rawPhotoLink.replaceFirst('http://192.168.1.2/api', '');

            settingservices.sharedPref
                .setString("username", response['data']['name']);
            settingservices.sharedPref.setString("photo", correctedPhotoLink);
            settingservices.sharedPref
                .setString("useremail", response['data']['email']);
            // da
            // settingservices.sharedPref
            //     .setString("phone", response['data']['phone']);
            settingservices.sharedPref.setInt("userid", response['data']['id']);
            settingservices.sharedPref
                .setString("version", response['version']);
            settingservices.sharedPref.setString("token", response['token']);
            // await settingservices.storagegit init
            //     .write(key: "token", value: response['token']);

            Get.offAndToNamed("/choosecountryscreen");
          } else if (response["message"] ==
              "This Email is not verified yet, We've sent a OTP to you") {
            Get.toNamed("/vertficationscreenLogin",
                arguments: {"email": email.text});
          } else {
            handleErrorResponse(response);
          }
        } else if (statueRequest == StatueRequest.offline) {
          Get.defaultDialog(
            title: "311".tr,
            middleText: "308".tr,
          );
        } else if (statueRequest == StatueRequest.ServerFaliure) {
          Get.defaultDialog(
            title: "311".tr,
            middleText: "307".tr,
          );
        }

        update();

        print("object");
        print(response);
        debugPrint(response);

        // Print user details
        User? user = userCredential.user;
        if (user != null) {
          print("Username: ${user.displayName}");
          print("Email: ${user.email}");
          print("Phone Number: ${user.phoneNumber ?? "No phone number"}");
        } else {
          print("test");
        }

        return userCredential;
      } catch (e) {
        print("Error during Google sign-in: $e");
      }
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "No internet connection detected.",
      );
    }
  }

  // Future<void> logout() async {
  //   try {
  //     await _googleSignIn.signOut();
  //     await _auth.signOut();
  //     print("User successfully logged out.");
  //   } catch (e) {
  //     print("Error during logout: $e");
  //   }
  // }

  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await user.delete();
        await _googleSignIn.disconnect();
        print("User account successfully deleted.");
      } else {
        print("No user is currently signed in.");
      }
    } catch (e) {
      print("Error during account deletion: $e");
    }
  }

  // requesthandler() async {
  //   await Permission.notification.request();
  //   status = await Permission.notification.status;
  //   if (status == Permission.notification.status.isGranted) {
  //     settingservices.sharedPref.setBool("IsSwitchedNotficationss", true);
  //   } else {
  //     settingservices.sharedPref.setBool("IsSwitchedNotficationss", false);
  //   }
  // }

  @override
  void onInit() {
    if ((checkinternet()) == true) {
      FirebaseMessaging.instance.getToken().then((value) {
        print(value);
        String? token = value;
      });
    }

    email = TextEditingController();
    Password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    Password.dispose();
    super.dispose();
  }
}
