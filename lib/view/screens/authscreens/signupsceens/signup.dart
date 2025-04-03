import 'package:ecommerce/controller/authcontroller/signupcontroller/signupcontroller.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpscreen extends StatelessWidget {
  const SignUpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUPcontrollerimp signupcontroller = Get.put(SignUPcontrollerimp());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Appbartext(appbartext: "19".tr),
      ),
      body: Form(
        key: signupcontroller.formstatekey,
        child: GetBuilder<SignUPcontrollerimp>(
          builder: (signupcontroller) => signupcontroller.statueRequest ==
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
                      horizontal: AppConstans.PaddingHorizontalAuth),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppConstans.distanceapppar,
                      ),
                      Textformfield(
                        lapeltext: "21".tr,
                        iconsuffix: null,
                        validatorfunc: (val) {
                          return valditor(
                              val!, val.length, val.length, "username");
                        },
                        textEditingController: signupcontroller.username,
                        textInputType: TextInputType.name,
                        hinttextstring: "ArenaX",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Textformfield(
                        iserroredtext: signupcontroller.iserroredtextemail,
                        errortext: signupcontroller.errortextemail,
                        lapeltext: "22".tr,
                        iconsuffix: null,
                        validatorfunc: (val) {
                          return valditor(
                            val!,
                            val.length,
                            val.length,
                            "Email",
                          );
                        },
                        textEditingController: signupcontroller.Email,
                        textInputType: TextInputType.emailAddress,
                        hinttextstring: "ArenaX@gmail.com",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Textformfield(
                        iserroredtext: signupcontroller.iserroredtextphone,
                        errortext: signupcontroller.errortextphone,
                        lapeltext: "23".tr,
                        iconsuffix: null,
                        validatorfunc: (val) {
                          return valditor(
                              val!, val.length, val.length, "phone");
                        },
                        textEditingController: signupcontroller.phone,
                        textInputType: TextInputType.phone,
                        hinttextstring: "121212121",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Textformfield(
                        iserroredtext: signupcontroller.ispasswordError,
                        errortext: signupcontroller.passwordError,
                        lapeltext: "24".tr,
                        iconsuffix: signupcontroller.obsecuretext
                            ? Icon(Icons.visibility_off_outlined,
                                color: Get.isDarkMode
                                    ? AppConstans.darkgreycolordarktheme
                                    : AppConstans.darkgreycolor)
                            : Icon(Icons.visibility,
                                color: Get.isDarkMode
                                    ? AppConstans.darkgreycolordarktheme
                                    : AppConstans.darkgreycolor),
                        obscureText: signupcontroller.obsecuretext,
                        showpassword: () {
                          signupcontroller.Obsecuretextfunction();
                        },
                        validatorfunc: (val) {
                          return valditor(
                              val!, val.length, val.length, "password",
                              passval1: signupcontroller.Password.text,
                              passval2: signupcontroller.confirmPassword!.text);
                        },
                        textEditingController: signupcontroller.Password,
                        hinttextstring: "xxxxxxxx",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Textformfield(
                        iserroredtext: signupcontroller.ispasswordError,
                        errortext: signupcontroller.passwordError,
                        lapeltext: "24".tr,
                        iconsuffix: signupcontroller.obsecuretext2
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility),
                        obscureText: signupcontroller.obsecuretext2,
                        showpassword: () {
                          signupcontroller.Obsecuretextfunction2();
                        },
                        validatorfunc: (val) {
                          return valditor(
                              val!, val.length, val.length, "password",
                              passval1: signupcontroller.Password.text,
                              passval2: signupcontroller.confirmPassword!.text);
                        },
                        textEditingController:
                            signupcontroller.confirmPassword!,
                        hinttextstring: "xxxxxxxx",
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "26".tr,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Get.isDarkMode == true
                                    ? AppConstans.Whitecolor
                                    : AppConstans.darkgreycolor),
                          ),
                          TextDectecot(
                            color: Get.isDarkMode
                                ? AppConstans.maincolordarktheme
                                : AppConstans.maincolorlighttheme,
                            text: "25".tr,
                            ontap: () {
                              signupcontroller.Gotologin();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Sharedbuttom(
                        text: "200".tr,
                        hight: AppConstans.authbottomsize,
                        onpreesed: () {
                          if (signupcontroller.formstatekey.currentState!
                              .validate()) {
                            signupcontroller.SigUP();
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
