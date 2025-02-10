import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconStack extends StatelessWidget {
  const IconStack({super.key, this.text});

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset("images/Bell.png",
              height: AppConstans.Width * .065,
              width: AppConstans.Width * .065,
              color: Get.isDarkMode == true
                  ? AppConstans.Whitecolor
                  : AppConstans.blackcolor),
        ),
        Positioned(
            top: 0,
            right: AppConstans.Width * .01,
            child: Container(
              height: AppConstans.Width * .018,
              width: AppConstans.Width * .018,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme),
            )),
      ],
    );
  }
}
