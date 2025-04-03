import 'package:ecommerce/controller/authcontroller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/bodysmallauth.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetpasswordScreen extends StatelessWidget {
  const ResetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Resetpasswordimple restcontroller = Get.put(Resetpasswordimple());
    return Form(
      key: restcontroller.formkey,
      child: Scaffold(
        resizeToAvoidBottomInset: AppConstans.resizebutton,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Appbartext(appbartext: "36".tr),
        ),
        body: GetBuilder<Resetpasswordimple>(
          builder: (restcontroller) =>
              restcontroller.statueRequest == StatueRequest.loading
                  ? Center(
                      child: Container(
                          width: AppConstans.IndicatorWidth,
                          height: AppConstans.IndicatorHight,
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
                          BodyAuth(authheadline: "37".tr),
                          SizedBox(
                            height: 24.h,
                          ),
                          Textformfield(
                              errortext: restcontroller.passwordError,
                              iserroredtext: restcontroller.errortextpassword,
                              iconsuffix: restcontroller.obsecuretext
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility),
                              obscureText: restcontroller.obsecuretext,
                              showpassword: () {
                                restcontroller.Obsecuretextfunction();
                              },
                              validatorfunc: (val) {
                                return valditor(
                                    val!, val.length, val.length, "password",
                                    passval1: restcontroller.password.text,
                                    passval2: restcontroller.repassword.text);
                              },
                              hinttextstring: "24".tr,
                              textEditingController: restcontroller.password),
                          SizedBox(
                            height: 24.h,
                          ),
                          Textformfield(
                              errortext: restcontroller.passwordError,
                              iserroredtext: restcontroller.errortextpassword,
                              iconsuffix: restcontroller.obsecuretext2
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility),
                              obscureText: restcontroller.obsecuretext2,
                              showpassword: () {
                                restcontroller.Obsecuretextfunction2();
                              },
                              validatorfunc: (val) {
                                return valditor(
                                    val!, val.length, val.length, "password",
                                    passval1: restcontroller.password.text,
                                    passval2: restcontroller.repassword.text);
                              },
                              hinttextstring: "24".tr,
                              icon: Icon(Icons.lock_outline),
                              textEditingController: restcontroller.repassword),
                          Spacer(),
                          Sharedbuttom(
                            text: "40".tr,
                            hight: 48.h,
                            onpreesed: () {
                              restcontroller.confirmpassword();
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
