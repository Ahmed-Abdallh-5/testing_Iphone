import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerIconButtom extends StatelessWidget {
  const ContainerIconButtom({super.key, this.onPressed, this.name});
  final String? name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstans.Hight * .045,
      width: AppConstans.Hight * .045,
      decoration: BoxDecoration(
          color: Get.isDarkMode == true
              ? AppConstans.blackcolor
              : AppConstans.Whitecolor,
          shape: BoxShape.circle),
      child: Center(
          child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Image.asset(
            name!,
            color: Get.isDarkMode == true
                ? AppConstans.Whitecolor
                : AppConstans.blackcolor,
          ),
        ),
      )),
    );
  }
}
