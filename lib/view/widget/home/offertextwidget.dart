import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          width: 14.w,
          height: 14.h,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          "Offer limited for ${textoffer}",
          style: TextStyleClass.getTextStyle(
            "medium",
            14.sp,
            color: Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme,
          ),
        )
      ],
    );
  }
}
