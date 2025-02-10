import 'package:ecommerce/controller/settingcon/editprofilecontroller.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowBottomBar extends StatelessWidget {
  const ShowBottomBar({super.key, this.camera, this.gallery});

  final Future<void> Function()? camera;
  final Future<void> Function()? gallery;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConstans.Hight * .038,
        width: AppConstans.Hight * .038,
        decoration: BoxDecoration(
            color: Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme,
            shape: BoxShape.circle),
        child: Center(
          child: IconButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: Icon(
              Icons.camera_alt,
              color: AppConstans.Whitecolor,
              size: AppConstans.Hight * .02,
            ),
            padding: EdgeInsets.all(0),
          ),
        ));
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          width: AppConstans.Width,
          height: AppConstans.Hight * .35,
          // color: Get.isDarkMode == true
          //     ? AppConstans.secondblackcolor
          //     : AppConstans.Whitecolor,
          decoration: BoxDecoration(
              color: Get.isDarkMode == true
                  ? AppConstans.secondblackcolor
                  : AppConstans.Whitecolor,
              borderRadius: BorderRadius.circular(AppConstans.Radious)),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstans.Width * .05),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppConstans.Hight * .01,
                    ),
                    Text(
                      "Profile image",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: AppConstans.Hight * .03,
                    ),
                    Sharedbuttom(
                        text: "Choose from Camera",
                        hight: AppConstans.Hight * 0.055,
                        onpreesed: camera!),
                    SizedBox(
                      height: AppConstans.Hight * .02,
                    ),
                    Sharedbuttom(
                        text: "Choose from gallery",
                        hight: AppConstans.Hight * 0.055,
                        onpreesed: gallery!),
                    SizedBox(
                      height: AppConstans.Hight * .02,
                    ),
                    Sharedbuttom(
                        textrcolor: Colors.red,
                        boredercolor: Colors.red,
                        color: Get.isDarkMode == true
                            ? AppConstans.secondblackcolor
                            : AppConstans.Whitecolor,
                        text: "Delete",
                        hight: AppConstans.Hight * 0.055,
                        onpreesed: camera!),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
