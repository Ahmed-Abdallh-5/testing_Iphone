import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, this.isactive});
  final bool? isactive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isactive == true ? 32 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: isactive == true
            ? Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme
            : (Get.isDarkMode ? AppConstans.Whitecolor : AppConstans.grey),
      ),
    );
  }
}
