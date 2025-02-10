// import 'package:ecommerce/controller/authcontroller/logincontroller.dart';
// import 'package:ecommerce/core/classes/statuerequest.dart';
// import 'package:ecommerce/core/constans/constansappvalues.dart';
// import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
// import 'package:ecommerce/view/widget/authwidgets/authtexts/headlinetext.dart';
// import 'package:ecommerce/view/widget/authwidgets/authtexts/ortext.dart';
// import 'package:ecommerce/view/widget/authwidgets/sqaureicon.dart';
// import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
// import 'package:ecommerce/view/widget/sharedbuttom.dart';
// import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class Loginscreen extends StatelessWidget {
//   const Loginscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Logincontrollerimp logcontroller = Get.put(Logincontrollerimp());
//     return Scaffold(
//         body: Form(
//       key: logcontroller.formKeylogin,
//       child: GetBuilder<Logincontrollerimp>(
//         builder: (controller) => controller.statueRequest ==
//                 StatueRequest.loading
//             ? Center(
//                 child: Container(
//                     width: AppConstans.IndicatorWidth,
//                     height: AppConstans.IndicatorHight,
//                     child: Lottie.asset(AppConstans.loadinglottie)),
//               )
//             : ListView(
//                 children: [
//                   SizedBox(
//                     height: AppConstans.Hight * 0.09,
//                   ),
//                   Image.asset(
//                     Get.isDarkMode
//                         ? AppConstans.logodark
//                         : AppConstans.logolight,
//                     width: AppConstans.Width * 0.18,
//                     height: AppConstans.Width * 0.18,
//                   ),
//                   SizedBox(height: AppConstans.Hight * 0.08),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: AppConstans.PaddingHorizontalAuth),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AuthHeadLine(authheadline: "11".tr),
//                         SizedBox(
//                           height: AppConstans.Hight * 0.03,
//                         ),
//                         Textformfield(
//                             iconsuffix: null,
//                             validatorfunc: (val) {
//                               return valditor(
//                                   val!, val.length, val.length, "Email");
//                             },
//                             textEditingController: logcontroller.email,
//                             hinttextstring: "13".tr,
//                             icon: Icon(Icons.email_outlined,
//                                 color: AppConstans.blackcolor)),
//                         SizedBox(
//                           height: AppConstans.Hight * .025,
//                         ),
//                         Textformfield(
//                             iconsuffix: logcontroller.obsecuretext
//                                 ? Icon(
//                                     Icons.visibility_outlined,
//                                   )
//                                 : Icon(Icons.visibility_off_outlined),
//                             obscureText: logcontroller.obsecuretext,
//                             showpassword: () {
//                               logcontroller.Obsecuretextfunction();
//                             },
//                             validatorfunc: (val) {
//                               return valditor(
//                                   val!, val.length, val.length, "password");
//                             },
//                             textEditingController: logcontroller.Password,
//                             hinttextstring: "14".tr,
//                             icon: Icon(Icons.lock_outline,
//                                 color: AppConstans.blackcolor)),
//                         SizedBox(
//                           height: AppConstans.Hight * .015,
//                         ),
//                         TextDectecot(
//                             text: "15".tr,
//                             ontap: () {
//                               logcontroller.GOTOForgetpassword();
//                             }),
//                         SizedBox(
//                           height: AppConstans.Hight * .05,
//                         ),
//                         Sharedbuttom(
//                           text: "25".tr,
//                           hight: AppConstans.Hight * 0.065,
//                           onpreesed: () {
//                             logcontroller.formKeylogin.currentState!.validate();
//                             logcontroller.login();
//                           },
//                         ),
//                         SizedBox(
//                           height: AppConstans.Hight * .02,
//                         ),
//                         OrText(),
//                         SizedBox(
//                           height: AppConstans.Hight * .02,
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: SquareIconButton(
//                             onPressed: () {
//                               logcontroller.signInWithGoogle();
//                             },
//                             iconData: FontAwesomeIcons.google,
//                           ),
//                         ),
//                         SizedBox(
//                           height: AppConstans.Hight * .03,
//                         ),
//                         Center(
//                           child: Row(
//                             children: [
//                               Text(
//                                 "17".tr,
//                                 style:
//                                     TextStyle(fontSize: AppConstans.Width / 25),
//                               ),
//                               TextDectecot(
//                                   text: "18".tr,
//                                   ontap: () {
//                                     logcontroller.GotoSignUP();
//                                   })
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     ));
//   }
// }
