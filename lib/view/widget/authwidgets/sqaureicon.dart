import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquareIconButton extends StatelessWidget {
  const SquareIconButton({super.key, this.onPressed, this.image});
  final void Function()? onPressed;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstans.Radious),
              color: Get.isDarkMode
                  ? AppConstans.secondblackcolor
                  : AppConstans.Whitecolor,
              border: Border.all(
                color: Get.isDarkMode
                    ? AppConstans.maincolordarktheme
                    : AppConstans.maincolorlighttheme,
              )),
          child: Container(
              margin: EdgeInsets.all(10.r), child: Image.asset(image!)),
        ));
  }
}
