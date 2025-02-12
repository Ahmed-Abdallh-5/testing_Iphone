import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/authfunctions/validator.dart';
import 'package:ecommerce/core/funtions/showbottomsheet.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/buttom.dart';
import 'package:ecommerce/view/widget/settingwidget/textfieldaccount.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/settingwidget/conatinerphoto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfleScreen extends StatelessWidget {
  const EditProfleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    return GetBuilder<MyaccountConimble>(
      builder: (myaccountConimble) => Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppConstans.Width * 0.05,
            right: AppConstans.Width * 0.05,
            bottom: AppConstans.Hight * 0.015,
          ),
          child: MaterialFixedButtom(
            isrowed: true,
            isEnabled: myaccountConimble.isanychanged,
            text: "222".tr,
            onPressed: () async {
              myaccountConimble.ChangeUsername(
                  myaccountConimble.username.text.isEmpty
                      ? settingservices.sharedPref.getString("username") ?? ''
                      : myaccountConimble.username.text);
            },
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          centerTitle: true,
          title: Appbartext(appbartext: "104".tr),
        ),
        body: Form(
          key: myaccountConimble.formstatekey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstans.Width * 0.05),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleContainerImage(
                          image: myaccountConimble.isimagechosen
                              ? FileImage(File(myaccountConimble.image!.path))
                              : CachedNetworkImageProvider(settingservices
                                  .sharedPref
                                  .getString("photo")!) as ImageProvider,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: myaccountConimble.isimagechosen == false
                              ? ShowBottomBar(
                                  camera: myaccountConimble.PickFromCamera,
                                  gallery: myaccountConimble.PickFromGallery,
                                )
                              : Container(
                                  height: AppConstans.Hight * 0.04,
                                  width: AppConstans.Hight * 0.04,
                                  decoration: BoxDecoration(
                                    color: Get.isDarkMode
                                        ? AppConstans.maincolordarktheme
                                        : AppConstans.maincolorlighttheme,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: myaccountConimble.uploadimage,
                                      icon: Icon(Icons.check),
                                      iconSize: AppConstans.Hight * 0.02,
                                      color: AppConstans.Whitecolor,
                                      padding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(width: AppConstans.Width * 0.05),
                    Expanded(
                      child: Text(
                        settingservices.sharedPref.getString("username")!,
                        style: TextStyleClass.getTextStyle(
                          "medium",
                          AppConstans.Hight * 0.025,
                          color: Get.isDarkMode
                              ? AppConstans.Whitecolor
                              : AppConstans.blackcolor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppConstans.Hight * 0.03),
                Container(
                  height: AppConstans.Hight * 0.3,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? AppConstans.secondblackcolor
                        : AppConstans.Whitecolor,
                    borderRadius: BorderRadius.circular(AppConstans.Radious),
                    border: Border.all(
                      color: Get.isDarkMode
                          ? AppConstans.darkgreycolor
                          : AppConstans.Bordercolor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.Width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          "21".tr,
                          style: TextStyleClass.getTextStyle(
                            "weight400",
                            AppConstans.Hight * 0.02,
                            color: Get.isDarkMode
                                ? AppConstans.Whitecolor
                                : AppConstans.blackcolor,
                          ),
                        ),
                        TextformfieldAccont(
                          onChanged: (val) {
                            if (val.isEmpty) {
                              myaccountConimble.isanychanged = false;
                              myaccountConimble.update();
                            } else {
                              myaccountConimble.isanychanged = true;
                              myaccountConimble.update();
                            }
                          },
                          imagesuffix: "images/Pen 4.png",
                          iconsuffix: null,
                          validatorfunc: (val) {
                            myaccountConimble.isanychanged = true;
                            return valditor(
                                val!, val.length, val.length, "username");
                          },
                          textEditingController: myaccountConimble.username,
                          hinttextstring: "ArenaX",
                        ),
                        Spacer(),
                        // SizedBox(height: AppConstans.Hight * 0.03),
                        Text(
                          "23".tr,
                          style: TextStyleClass.getTextStyle(
                            "weight400",
                            AppConstans.Hight * 0.02,
                            color: Get.isDarkMode
                                ? AppConstans.Whitecolor
                                : AppConstans.blackcolor,
                          ),
                        ),
                        TextformfieldAccont(
                          onChanged: (p0) {
                            myaccountConimble.isanychanged = true;
                          },
                          imagesuffix: "images/Pen 4.png",
                          iconsuffix: null,
                          validatorfunc: (val) {
                            if (val!.isEmpty == false) {
                              return valditor(
                                  val!, val.length, val.length, "phone");
                            } else {
                              val = myaccountConimble.phoneint;
                              return valditor(
                                  val!, val.length, val.length, "phone");
                            }
                          },
                          textEditingController: myaccountConimble.username,
                          hinttextstring: "ArenaX",
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppConstans.Hight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
