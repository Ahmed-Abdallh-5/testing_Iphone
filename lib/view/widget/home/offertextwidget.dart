import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextOfferWidget extends StatelessWidget {
  const TextOfferWidget({super.key, this.textoffer});
  final textoffer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "images/Sale.png",
          color: Get.isDarkMode
              ? AppConstans.maincolordarktheme
              : AppConstans.maincolorlighttheme,
        ),
        SizedBox(
          width: AppConstans.Width * .01,
        ),
        Text(
          "Offer limited for ${textoffer}",
          style: TextStyleClass.getTextStyle(
            "medium",
            AppConstans.Width * .04,
            color: Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme,
          ),
        )
      ],
    );
  }
}
