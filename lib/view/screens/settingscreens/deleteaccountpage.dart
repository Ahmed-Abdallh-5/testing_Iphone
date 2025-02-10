import 'package:ecommerce/controller/settingcon/deleteaccount.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/authwidgets/textformfield.dart';
import 'package:ecommerce/view/widget/dialougchoicebuttoms.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteAccountimple deleteAccountimple = Get.put(DeleteAccountimple());
    double width = AppConstans.Width;
    double height = AppConstans.Hight;

    return Form(
      key: deleteAccountimple.formkey,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.015,
          ),
          child: MaterialFixedButtom(
            isrowed: true,
            isEnabled: true,
            text: "40".tr,
            onPressed: () async {
              if (deleteAccountimple.formkey.currentState!.validate()) {
                Get.defaultDialog(
                  radius: 20,
                  title: "337".tr,
                  titleStyle:
                      TextStyleClass.getTextStyle("weight300", width * 0.04),
                  middleText: "",
                  confirm: Padding(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: DialougButtom(
                      buttomcolor: Get.isDarkMode
                          ? AppConstans.maincolordarktheme
                          : AppConstans.maincolorlighttheme,
                      width: width * 0.3,
                      text: "338".tr,
                      hight: height * 0.05,
                      onpreesed: () {
                        deleteAccountimple.Delete();
                      },
                    ),
                  ),
                  cancel: Padding(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: DialougButtom(
                      width: width * 0.3,
                      buttomcolor: Get.isDarkMode
                          ? AppConstans.maincolordarktheme
                          : AppConstans.maincolorlighttheme,
                      text: "339".tr,
                      hight: height * 0.05,
                      onpreesed: () {
                        Get.back();
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
          centerTitle: true,
          title: Appbartext(appbartext: "114".tr),
        ),
        body: GetBuilder<DeleteAccountimple>(
          builder: (deleteAccountimple) => deleteAccountimple.statueRequest ==
                  StatueRequest.loading
              ? Center(
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.15,
                    child: Lottie.asset(AppConstans.loadinglottie),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.03),
                        Center(
                          child: Text("340".tr,
                              style: TextStyleClass.getTextStyle(
                                "weight400",
                                width * 0.05,
                              )),
                        ),
                        SizedBox(height: height * 0.03),
                        Textformfield(
                          iconsuffix: deleteAccountimple.obsecuretext
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility),
                          obscureText: deleteAccountimple.obsecuretext,
                          showpassword: () {
                            deleteAccountimple.Obsecuretextfunction();
                          },
                          validatorfunc: (val) {
                            return valditor(
                              val!,
                              val.length,
                              val.length,
                              "password delation",
                            );
                          },
                          hinttextstring: "24".tr,
                          icon: Icon(Icons.lock_outline),
                          textEditingController: deleteAccountimple.password,
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
