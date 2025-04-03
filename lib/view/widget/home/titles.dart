import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Titles extends StatelessWidget {
  const Titles(
      {super.key, this.text1, this.text2, this.onTap, this.iconneeded = true});
  final String? text1;
  final String? text2;
  final void Function()? onTap;
  final bool? iconneeded;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text1!,
          style: TextStyleClass.getTextStyle("weight500", 24.sp),
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
                  text2 ?? "",
                  style: TextStyleClass.getTextStyle(
                    "weight500",
                    14.sp,
                    color: Get.isDarkMode
                        ? AppConstans.maincolordarktheme
                        : AppConstans.maincolorlighttheme,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                iconneeded == true
                    ? Icon(
                        Icons.arrow_forward_ios,
                        size: 24.r,
                        color: Get.isDarkMode
                            ? AppConstans.maincolordarktheme
                            : AppConstans.maincolorlighttheme,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
