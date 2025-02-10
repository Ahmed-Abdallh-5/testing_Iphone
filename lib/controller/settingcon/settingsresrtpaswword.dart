// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/funtions/handlingdata.dart';
// import 'package:ecommerce/core/services/settingservices.dart';
// import 'package:ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// abstract class SettingResetpassword extends GetxController {
//   void confirmpassword();
// }

// class SettingResetpasswordimple extends SettingResetpassword {
//   late TextEditingController password;
//   late TextEditingController repassword;

//   StatueRequest? statueRequest;
//   ResetPassword resetPassword = ResetPassword(Get.find());
//   String? Email;
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   Settingservices settingservices = Get.put(Settingservices());
//   void confirmpassword() async {
//     if (formkey.currentState!.validate()) {
//       if (password.text != repassword.text) {
//         return Get.defaultDialog(title: "41".tr, middleText: "42".tr);
//       }

//       statueRequest = StatueRequest.loading;
//       update();
//       var response = await resetPassword.Sendingdata(
//         Email!,
//         password.text,
//       );
//       statueRequest = handlingdata(response);
//       if (StatueRequest.Success == statueRequest) {
//         print(response);

//         if (response["message"] == 'success') {
//           Get.toNamed(
//             "/SuccesResetPassWord",
//           );
//         } else {
//           Get.defaultDialog(title: "43".tr, middleText: "44".tr);
//         }

//         update();
//       }
//     }

//     // Get.offAllNamed("/SuccesResetPassWord");
//   }

//   @override
//   void onInit() {
//     Email = settingservices.sharedPref.getString("email");
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
