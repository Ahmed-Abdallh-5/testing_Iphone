import 'package:ecommerce/controller/authcontroller/login/logincontroller.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/ortext.dart';
import 'package:ecommerce/view/widget/authwidgets/sqaureicon.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Logincontrollerimp logcontroller = Get.put(Logincontrollerimp());

    return 
       Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Appbartext(appbartext: "11".tr),
        ),
        body: Form(
          key: logcontroller.formKeylogin,
          child: GetBuilder<Logincontrollerimp>(
            builder: (controller) => controller.statueRequest ==
                    StatueRequest.loading
                ? Center(
                    child: Container(
                      width: AppConstans.IndicatorWidth,
                      height: AppConstans.IndicatorHight,
                      child: Lottie.asset(Get.isDarkMode
                          ? AppConstans.loadinglottiedark
                          : AppConstans.loadinglottielight),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstans.PaddingHorizontalAuth,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: AppConstans.distanceapppar),
                        Textformfield(
                          iserroredtext: logcontroller.iserroredtextemail,
                          errortext: logcontroller.errortextemail,
                          lapeltext: "13".tr,
                          iconsuffix: null,
                          validatorfunc: (val) {
                            return valditor(
                                val!, val.length, val.length, "Email");
                          },
                          textEditingController: logcontroller.email,
                          hinttextstring: "ArenaX@gmail.com",
                        ),
                        SizedBox(height: AppConstans.distancebetweentextfield),
                        Textformfield(
                          iserroredtext: logcontroller.errortextpassword,
                          errortext: logcontroller.passwordError,
                          lapeltext: "14".tr,
                          iconsuffix: logcontroller.obsecuretext
                              ? Icon(Icons.visibility_outlined,
                                  color: Get.isDarkMode
                                      ? AppConstans.darkgreycolordarktheme
                                      : AppConstans.darkgreycolor)
                              : Icon(Icons.visibility_off_outlined,
                                  color: Get.isDarkMode
                                      ? AppConstans.darkgreycolordarktheme
                                      : AppConstans.darkgreycolor),
                          obscureText: logcontroller.obsecuretext,
                          showpassword: () {
                            logcontroller.Obsecuretextfunction();
                          },
                          validatorfunc: (val) {
                            return valditor(
                                val!, val.length, val.length, "password");
                          },
                          textEditingController: logcontroller.Password,
                          hinttextstring: "xxxxxxxxx",
                        ),
                        SizedBox(height: 8.h),
                        TextDectecot(
                          color: Get.isDarkMode == true
                              ? AppConstans.Whitecolor
                              : AppConstans.darkgreycolor,
                          text: "15".tr,
                          ontap: () {
                            logcontroller.GOTOForgetpassword();
                          },
                        ),
                        Spacer(),
                        // SizedBox(height: 302.h),
                        OrText(),
                        SizedBox(height: 16.h),
                        Align(
                          alignment: Alignment.center,
                          child: SquareIconButton(
                            image: "images/pngwing.com.png",
                            onPressed: () {
                              logcontroller.signInWithGoogle();
                              // logcontroller.logout();
                            },
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: SquareIconButton(
                        //     image: "images/pngwing.com.png",
                        //     onPressed: () {
                        //       logcontroller.signInWithFacebook();
                        //     },
                        //   ),
                        // ),
                        SizedBox(height: 91.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "17".tr,
                              style: TextStyleClass.getTextStyle(
                                  "weight400", 16.sp,
                                  color: Get.isDarkMode == true
                                      ? AppConstans.Whitecolor
                                      : AppConstans.darkgreycolor),
                            ),
                            TextDectecot(
                              color: Get.isDarkMode
                                  ? AppConstans.maincolordarktheme
                                  : AppConstans.maincolorlighttheme,
                              text: "18".tr,
                              ontap: () {
                                logcontroller.GotoSignUP();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Sharedbuttom(
                          text: "25".tr,
                          hight: AppConstans.authbottomsize,
                          onpreesed: () {
                            if (logcontroller.formKeylogin.currentState!
                                .validate()) {
                              print("login");
                              logcontroller.login();
                            }
                          },
                        ),
                        SizedBox(height: AppConstans.distancefrombottombar)
                      ],
                    ),
                  ),
          ),
        ),
      
    );
  }
}
