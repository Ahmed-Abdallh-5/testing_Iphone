import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/controller/settingcon/settingscreen.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/settingwidget/iconsetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SettingScreeneScreen extends StatelessWidget {
  const SettingScreeneScreen({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    Settingscreenimble settingscreenimble = Get.put(Settingscreenimble());
    MyaccountConimble myaccountConimble = Get.put(MyaccountConimble());
    return GetBuilder<Settingscreenimble>(
      builder: (settingscreenimble) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Appbartext(appbartext: "85".tr),
            leading: Padding(
              padding: EdgeInsets.only(left: AppConstans.PaddingHorizontalAuth),
              child: IconButton(
                  onPressed: () {
                    Get.forceAppUpdate();
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstans.PaddingHorizontalAuth),
            child: ListView(
              children: [
                SizedBox(
                  height: AppConstans.distanceapppar,
                ),
                Container(
                  height: AppConstans.Hight * .4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppConstans.secondblackcolor
                          : const Color.fromARGB(255, 255, 253, 255),
                      borderRadius: BorderRadius.circular(AppConstans.Radious),
                      border: Border.all(
                          color: Get.isDarkMode == false
                              ? AppConstans.Bordercolor
                              : AppConstans.darkgreycolor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.PaddingHorizontalAuth),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            settingscreenimble.GoToEditprofile();
                          },
                          istrashed: false,
                          image: "images/User Rounded.png",
                          switcher: false,
                          text: "104".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            settingscreenimble.ChangeingLanguage();
                          },
                          isrowed: true,
                          istrashed: false,
                          image: "images/Global.png",
                          rowtext:
                              settingservices.sharedPref.getString("lang") ==
                                      "ar"
                                  ? "العربية"
                                  : "English",
                          switcher: false,
                          text: "88".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            settingscreenimble.Gotochangecountry();
                          },
                          istrashed: false,
                          image: "images/Map Point.png",
                          switcher: false,
                          text: "89".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            settingscreenimble.GoToEditResetPaswword();
                          },
                          istrashed: false,
                          image: "images/Lock.png",
                          switcher: false,
                          text: "90".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          icon: Icons.dark_mode_outlined,
                          activeColor: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                          value: settingservices.sharedPref.getBool(
                              "${settingscreenimble.IsSwitchedNotfications}")!,
                          onChanged: (value) {
                            // settingscreenimble.notficationSwitcherFunction(
                            //     value, "id1");
                            // print(settingservices.sharedPref.getBool(
                            //     "${settingscreenimble.IsSwitchedNotfications}"));
                          },
                          switcher: true,
                          istrashed: false,
                          image: "images/Bell.png",
                          text: "92".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          icon: Icons.light_mode_outlined,
                          activeColor: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                          value: settingservices.sharedPref
                                      .getBool("IsSwitched") ==
                                  null
                              ? settingscreenimble.IsSwitched
                              : settingservices.sharedPref
                                  .getBool("IsSwitched")!,
                          onChanged: (value) {
                            settingscreenimble.ChangeSwitcherButtonDarkLight(
                                value);
                            settingscreenimble.SwitchDarkMode(context);
                          },
                          istrashed: false,
                          image: "images/Moon.png",
                          switcher: true,
                          text: "91".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                Container(
                  height: AppConstans.Hight * .2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode == true
                          ? AppConstans.secondblackcolor
                          : const Color.fromARGB(255, 255, 253, 255),
                      borderRadius: BorderRadius.circular(AppConstans.Radious),
                      border: Border.all(
                          color: Get.isDarkMode == false
                              ? AppConstans.Bordercolor
                              : AppConstans.darkgreycolor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.PaddingHorizontalAuth),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            Get.toNamed('/aboutUsScreen');
                          },
                          istrashed: false,
                          image: "images/Question Circle.png",
                          switcher: false,
                          text: "93".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            Get.toNamed('/privacyScreen');
                          },
                          istrashed: false,
                          image: "images/Shield Warning.png",
                          switcher: false,
                          text: "94".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            Get.toNamed('/termsAndConditionsScreen');
                          },
                          istrashed: false,
                          image: "images/File Text.png",
                          switcher: false,
                          text: "95".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                Container(
                  height: AppConstans.Hight * .15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode == true
                          ? AppConstans.secondblackcolor
                          : const Color.fromARGB(255, 255, 253, 255),
                      borderRadius: BorderRadius.circular(AppConstans.Radious),
                      border: Border.all(
                          color: Get.isDarkMode == false
                              ? AppConstans.Bordercolor
                              : AppConstans.darkgreycolor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.PaddingHorizontalAuth),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            settingscreenimble.logout();
                          },
                          isred: true,
                          istrashed: true,
                          image: "images/Logout 2.png",
                          switcher: false,
                          text: "97".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                        IconSetting(
                          onTap: () {
                            settingscreenimble.GoToDeleteaccount();
                          },
                          isred: true,
                          istrashed: true,
                          image: "images/Trash Bin 2.png",
                          switcher: false,
                          text: "96".tr,
                        ),
                        SizedBox(
                          height: AppConstans.Hight * .022,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstans.Hight * .022,
                ),
              ],
            ),
          )),
    );
  }
}
