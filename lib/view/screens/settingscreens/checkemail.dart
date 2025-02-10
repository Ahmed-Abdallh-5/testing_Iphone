import 'package:ecommerce/controller/authcontroller/resetpasssetting/checkemail.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/bodysmallauth.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/haedline2.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordSettingPageimple forgetpasscontroller =
        Get.put(ForgetpasswordSettingPageimple());
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHight = MediaQuery.of(context).size.height;
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
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenWidth * .11),
            child: Appbartext(appbartext: "28".tr)),
      ),
      body: Form(
          key: forgetpasscontroller.keyow,
          child: GetBuilder<ForgetpasswordSettingPageimple>(
            builder: (forgetpasscontroller) => forgetpasscontroller
                        .statueRequest ==
                    StatueRequest.loading
                ? Center(
                    child: Container(
                        width: ScreenWidth * .15,
                        height: ScreenHight * .15,
                        child: Lottie.asset('lottie/loading.json')),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: ScreenHight * .065,
                      ),
                      AuthHeadLinesmall(authheadline: "29".tr),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: ScreenWidth * .05),
                        child: BodyAuth(authheadline: "30".tr),
                      ),
                      SizedBox(
                        height: ScreenHight * .065,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenWidth * 0.03),
                        child: Textformfield(
                            validatorfunc: (val) {
                              return valditor(
                                  val!, val!.length, val!.length, "Email");
                            },
                            hinttextstring: "32".tr,
                            icon: Icon(
                              Icons.email_outlined,
                              color: AppConstans.IconColor,
                            ),
                            textEditingController: forgetpasscontroller.email),
                      ),
                      SizedBox(
                        height: ScreenHight * .065,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenWidth * 0.03),
                        child: Sharedbuttom(
                          text: "31".tr,
                          hight: 50,
                          onpreesed: () {
                            forgetpasscontroller.keyow.currentState!.validate();
                            forgetpasscontroller.ConfirmEmail();
                          },
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
