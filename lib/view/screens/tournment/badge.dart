import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgeWithText extends StatelessWidget {
  final String imagePath;
  final String text;
  final String text2;

  const BadgeWithText({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Row(
          children: [
            Image.asset(
              imagePath,
              // height: 30, // Adjust as needed
              // width: 30,  // Adjust as needed
            ),
            Text(
              text2,
              style: TextStyleClass.getTextStyle(
                  "weight500", AppConstans.Hight / 60,
                  color: Get.isDarkMode == true
                      ? AppConstans.Whitecolor
                      : AppConstans
                          .darkgreycolor), // Customize text style as needed
            ),
          ],
        ),
        Text(
          text,
          style: TextStyleClass.getTextStyle("weight500",
              AppConstans.Hight / 45), // Customize text style as needed
        ),
        Spacer(),
      ],
    );
  }
}
