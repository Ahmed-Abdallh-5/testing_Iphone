// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class ResetpasswordSettingPage extends GetxController {
//   void confirmpassword();
//   Obsecuretextfunction2();
//   Obsecuretextfunction();
// }

// class ResetpasswordSettingPageimple extends ResetpasswordSettingPage {
//   late TextEditingController password;
//   late TextEditingController repassword;
//   bool obsecuretext = true;
//   bool obsecuretext2 = true;
//   StatueRequest? statueRequest;
//   ResetPassword resetPassword = ResetPassword(Get.find());
//   String? Email;
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   void confirmpassword() async {
//     if (formkey.currentState!.validate()) {
//       statueRequest = StatueRequest.loading;
//       update();
//       var response = await resetPassword.Sendingdata(
//         Email!,
//         password.text,
//       );
//       statueRequest = handlingdata(response);
//       if (StatueRequest.Success == statueRequest) {
//         print(response);

//         if (response["message"] == 'Password has been changed successfully.') {
//           Get.offNamed(
//             "/succesResetPassWordSettingPage",
//           );
//         }
//       } else if (statueRequest == StatueRequest.offline) {
//         Get.defaultDialog(
//           title: "Warning",
//           middleText: "No internet connection. Please check your internet.",
//         );
//       } else if (statueRequest == StatueRequest.ServerFaliure) {
//         Get.defaultDialog(
//           title: "Warning",
//           middleText: "Error 404",
//         );
//       }
//     }

//     // Get.offAllNamed("/SuccesResetPassWord");
//   }

//   Obsecuretextfunction() {
//     if (obsecuretext == true) {
//       obsecuretext = false;
//     } else {
//       obsecuretext = true;
//     }

//     update();
//   }

//   Obsecuretextfunction2() {
//     if (obsecuretext2 == true) {
//       obsecuretext2 = false;
//     } else {
//       obsecuretext2 = true;
//     }

//     update();
//   }

//   @override
//   void onInit() {
//     Email = Get.arguments["email"];
//     password = TextEditingController();
//     repassword = TextEditingController();

//     super.onInit();
//   }

//   @override
//   void dispose() {
//     password.dispose();
//     repassword.dispose();
//     super.dispose();
//   }
// }
