import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoiceButtom extends StatelessWidget {
  const ChoiceButtom(
      {super.key,
      this.iscolored,
      this.onPressed,
      this.text1,
      this.text2,
      this.text3,
      this.text4});
  final bool? iscolored;
  final void Function()? onPressed;
  final bool? text1;
  final String? text3;

  final String? text2;
  final String? text4;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConstans.Hight * .06,
        width: AppConstans.Width / 2.5,
        decoration: BoxDecoration(
          color: iscolored!
              ? Get.isDarkMode
                  ? AppConstans.maincolordarktheme
                  : AppConstans.maincolorlighttheme
              : (Get.isDarkMode == true
                  ? AppConstans.secondblackcolor
                  : AppConstans.Whitecolor),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: text1!
              ? Text(
                  text2!,
                  style: TextStyleClass.getTextStyle(
                    "Bold",
                    AppConstans.Width / 24,
                    color: AppConstans.Whitecolor,
                  ),
                )
              : Text(
                  text3!,
                  style: TextStyleClass.getTextStyle(
                    "weight500",
                    AppConstans.Width / 24,
                    color: Get.isDarkMode
                        ? AppConstans.maincolordarktheme
                        : AppConstans.maincolorlighttheme,
                  ),
                ),
        ));
  }
}
