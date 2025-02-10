import 'package:ecommerce/controller/authcontroller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/bodysmallauth.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:flutter/material.dart';
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
                          child: Lottie.asset(AppConstans.loadinglottie)),
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
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 40),
                          //   child: BodyAuth(
                          //       authheadline: "Please Enter Your Email Address To send You"),
                          // ),
                          SizedBox(
                            height: AppConstans.Sizeboxsize * 2,
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
                              icon: Icon(Icons.lock_outline),
                              textEditingController: restcontroller.password),

                          SizedBox(
                            height: AppConstans.Sizeboxsize,
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
                            hight: AppConstans.Hight * .06,
                            onpreesed: () {
                              restcontroller.confirmpassword();
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
