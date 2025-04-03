import 'package:ecommerce/controller/authcontroller/login/loginvertficioncon.dart';

import 'package:ecommerce/core/classes/statuerequest.dart';

import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/bodysmallauth.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';

class VertficationscreenLogin extends StatelessWidget {
  const VertficationscreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    VerficationControllerLoginimple vertfiycontroller =
        Get.put(VerficationControllerLoginimple());
    Settingservices settingservices = Get.find();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Appbartext(appbartext: "33".tr),
        ),
        body: GetBuilder<VerficationControllerLoginimple>(
          builder: (vertfiycontrollerr) => vertfiycontrollerr.statueRequest ==
                  StatueRequest.loading
              ? Center(
                  child: Container(
                      width: AppConstans.IndicatorWidth,
                      height: AppConstans.Width * .15,
                      child: Lottie.asset(Get.isDarkMode
                          ? AppConstans.loadinglottiedark
                          : AppConstans.loadinglottielight)),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstans.PaddingHorizontalAuth),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppConstans.distanceapppar,
                      ),
                      BodyAuth(authheadline: "35".tr),
                      SizedBox(
                        height: 24.h,
                      ),
                      OtpTextField(
                        textStyle: TextStyleClass.getTextStyle(
                          "medium",
                          24.sp,
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                        ),

                        cursorColor: Get.isDarkMode
                            ? AppConstans.maincolordarktheme
                            : AppConstans.maincolorlighttheme,
                        borderWidth: 1.2,
                        fieldHeight: 64,
                        fieldWidth: 64,
                        borderRadius:
                            BorderRadius.circular(AppConstans.Radious),
                        numberOfFields: 5,
                        // borderColor: AppConstans.themecolor,
                        focusedBorderColor: Get.isDarkMode
                            ? AppConstans.maincolordarktheme
                            : AppConstans.maincolorlighttheme,

                        enabledBorderColor: Get.isDarkMode
                            ? AppConstans.maincolordarktheme
                            : AppConstans.maincolorlighttheme,
                        showFieldAsBox: true,
                        // Listen for input changes
                        onCodeChanged: (String code) {
                          if (settingservices.sharedPref.getString("lang") ==
                              "ar") {
                            String reversedCode =
                                code.split('').reversed.join('');
                            vertfiycontrollerr
                                .updateVerificationCode(reversedCode);
                          } else {
                            vertfiycontrollerr.updateVerificationCode(code);
                          }
                        },
                        // Optional: Handle final submission logic
                        onSubmit: (String verificationCode) {
                          if (settingservices.sharedPref.getString("lang") ==
                              "ar") {
                            vertfiycontrollerr.updateVerificationCode(
                                verificationCode.split('').reversed.join(''));
                          } else {
                            vertfiycontrollerr
                                .updateVerificationCode(verificationCode);
                          }
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextDectecot(
                          alignment: Alignment.center,
                          text: vertfiycontrollerr.isbuttomenable == true
                              ? " Resend code"
                              : "Resend code after ${vertfiycontrollerr.timersecomds}",
                          ontap: vertfiycontrollerr.isbuttomenable == true
                              ? () {
                                  vertfiycontrollerr.ResendCode();
                                  vertfiycontrollerr.Timerfunc();
                                }
                              : null,
                          color: vertfiycontroller.isbuttomenable == true
                              ? (Get.isDarkMode
                                  ? AppConstans.maincolordarktheme
                                  : AppConstans.maincolorlighttheme)
                              : AppConstans.nonenabledbuttomcolor),
                      Spacer(),
                      Sharedbuttom(
                        isEnabled: vertfiycontrollerr.enable,
                        text: "201".tr,
                        hight: AppConstans.Hight * 0.065,
                        onpreesed: () {
                          if (settingservices.sharedPref.getString("lang") ==
                              "ar") {
                            vertfiycontrollerr.confirmCode(
                                vertfiycontrollerr.verificationCode!);
                          } else {
                            vertfiycontrollerr.confirmCode(
                                vertfiycontrollerr.verificationCode!);
                          }
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
        ));
  }
}
