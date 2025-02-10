import 'package:ecommerce/controller/authcontroller/signupcontroller/signupcontroller.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
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
                    child: Lottie.asset(AppConstans.loadinglottie),
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
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: AppConstans.IconColor,
                        ),
                      ),
                      SizedBox(
                        height: AppConstans.Sizeboxsize,
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
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppConstans.IconColor,
                        ),
                      ),
                      SizedBox(
                        height: AppConstans.Sizeboxsize,
                      ),
                      Textformfield(
                        // preixtext: "+20",
                        // isphonetext: true,
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
                        icon: Icon(
                          Icons.phone_android_outlined,
                          color: AppConstans.IconColor,
                        ),
                      ),

                      SizedBox(
                        height: AppConstans.Sizeboxsize,
                      ),
                      Textformfield(
                        iserroredtext: signupcontroller.ispasswordError,
                        errortext: signupcontroller.passwordError,
                        lapeltext: "24".tr,
                        iconsuffix: signupcontroller.obsecuretext
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility),
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
                        icon: Icon(
                          Icons.lock_outline,
                          color: AppConstans.IconColor,
                        ),
                      ),
                      SizedBox(
                        height: AppConstans.Sizeboxsize,
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
                        icon: Icon(
                          Icons.lock_outline,
                          color: AppConstans.IconColor,
                        ),
                      ),
                      SizedBox(
                        height: AppConstans.Sizeboxsize,
                      ),
                      // Spacer to push the button down

                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "26".tr,
                            style: TextStyle(
                                fontSize: AppConstans.Width / 25,
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
                      const SizedBox(height: 16),
                      Sharedbuttom(
                        text: "200".tr,
                        hight: AppConstans.Hight * 0.065,
                        onpreesed: () {
                          if (signupcontroller.formstatekey.currentState!
                              .validate()) {
                            signupcontroller.SigUP();
                          }
                        },
                      ),
                      SizedBox(height: AppConstans.Hight * 0.06),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
