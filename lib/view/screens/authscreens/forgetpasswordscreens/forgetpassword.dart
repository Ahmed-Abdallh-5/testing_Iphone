import 'package:ecommerce/controller/authcontroller/forgetpassword/checkemail.dart';
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

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Forgetpasswordimple forgetpasscontroller = Get.put(Forgetpasswordimple());
    return Scaffold(
      resizeToAvoidBottomInset: AppConstans.resizebutton,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        centerTitle: true,
        title: Appbartext(appbartext: "28".tr),
      ),
      body: Form(
          key: forgetpasscontroller.keyow,
          child: GetBuilder<Forgetpasswordimple>(
            builder: (forgetpasscontroller) => forgetpasscontroller
                        .statueRequest ==
                    StatueRequest.loading
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
                        // AuthHeadLinesmall(authheadline: "29".tr),
                        BodyAuth(authheadline: "30".tr),
                        SizedBox(
                          height: 24.h,
                        ),
                        Textformfield(
                            iserroredtext:
                                forgetpasscontroller.iserroredtextemail,
                            errortext: forgetpasscontroller.errortextemail,
                            lapeltext: "32".tr,
                            validatorfunc: (val) {
                              return valditor(
                                  val!, val.length, val.length, "Email");
                            },
                            hinttextstring: "ArenaX@gmail.com",
                            textEditingController: forgetpasscontroller.email),
                        SizedBox(
                          height: AppConstans.Sizeboxsize * 1.5,
                        ),
                        Spacer(),
                        Sharedbuttom(
                          text: "31".tr,
                          hight: AppConstans.authbottomsize,
                          onpreesed: () {
                            forgetpasscontroller.keyow.currentState!.validate();

                            forgetpasscontroller.ConfirmEmail();
                          },
                        ),

                        SizedBox(height: AppConstans.distancefrombottombar)
                      ],
                    ),
                  ),
          )),
    );
  }
}
