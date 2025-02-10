import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
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
          height: AppConstans.Hight * .06,
          width: AppConstans.Hight * .06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstans.Radious),
              border: Border.all(
                color: Get.isDarkMode
                    ? AppConstans.maincolordarktheme
                    : AppConstans.maincolorlighttheme,
              )),
          child:
              Container(margin: EdgeInsets.all(5), child: Image.asset(image!)),
        ));
  }
}
