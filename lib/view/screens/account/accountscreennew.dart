import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/screens/myfavouritecontainer.dart';
import 'package:ecommerce/view/widget/home/titles.dart';
import 'package:ecommerce/view/widget/settingwidget/conatinerphoto.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyaccountConimble myaccountConimble = Get.put(MyaccountConimble());
    Settingservices settingservices = Get.find();
    // EditProfileImple editProfileImple = Get.put(EditProfileImple());
    return GetBuilder<MyaccountConimble>(
      builder: (myaccountConimble) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstans.PaddingHorizontalAuth,
          ),
          child: ListView(
            children: [
              SizedBox(height: AppConstans.distanceapppar),
              Row(
                children: [
                  CircleContainerImage(
                      image: CachedNetworkImageProvider(
                          settingservices.sharedPref.getString("photo")!)),
                  SizedBox(width: AppConstans.Width * .028),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                settingservices.sharedPref
                                    .getString("username")!,
                                style: TextStyleClass.getTextStyle(
                                    "medium", AppConstans.Hight * .028),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                myaccountConimble.gotosettingpage();
                              },
                              icon: Icon(Icons.settings_outlined),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextDectecot(
                                smallfont: true,
                                text: "104".tr,
                                ontap: () {
                                  myaccountConimble.Gotoedtoscreen();
                                },
                                color: Get.isDarkMode
                                    ? AppConstans.maincolordarktheme
                                    : AppConstans.maincolorlighttheme),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstans.Hight * 0.03),
              Titles(
                onTap: () {
                  myaccountConimble.gotofavouritescreen();
                },
                text1: "205".tr,
                text2: "64".tr,
              ),
              MyFavouriteOneContainer(
                myAccountCon: MyaccountConimble(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
