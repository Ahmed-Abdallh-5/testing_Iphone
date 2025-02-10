import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Titles extends StatelessWidget {
  const Titles({super.key, this.text1, this.text2, this.onTap});
  final String? text1;
  final String? text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text1!,
          style: TextStyleClass.getTextStyle(
              "weight500", AppConstans.Width * .047),
          textAlign: TextAlign.left,
        ),
        Spacer(),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  text2!,
                  style: TextStyleClass.getTextStyle(
                    "weight500",
                    AppConstans.Width * .04,
                    color: Get.isDarkMode
                        ? AppConstans.maincolordarktheme
                        : AppConstans.maincolorlighttheme,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppConstans.Width * .045,
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
