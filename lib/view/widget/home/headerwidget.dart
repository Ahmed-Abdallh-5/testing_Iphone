import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RowHomeScreen extends StatelessWidget {
  const RowHomeScreen(
      {super.key, this.icons, this.text, this.onTap, this.text2, this.text3});

  final IconData? icons;
  final String? text;
  final String? text2;
  final String? text3;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text!,
          style: TextStyleClass.getTextStyle("medium", 24.sp),
          textAlign: TextAlign.left,
        ),
        Spacer(),
        Text(
          text2!,
          style: TextStyleClass.getTextStyle(
            "bold", 20.sp,
            // color: Get.isDarkMode
            //     ? AppConstans.maincolordarktheme
            //     : AppConstans.maincolorlighttheme
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          text3!,
          style: TextStyleClass.getTextStyle(
            "bold",
            20.sp,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
