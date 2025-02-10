import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    return InkWell(
      onTap: onTap,
      child: Container(
          constraints: BoxConstraints(
              minHeight: AppConstans.Hight / 10,
              minWidth: AppConstans.Width / 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).brightness == ThemeMode.dark
                ? AppConstans.Whitecolor
                : AppConstans.blackcolor,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).brightness == ThemeMode.dark
                  ? AppConstans.blackcolor
                  : AppConstans.Whitecolor,
            ),
          )),
    );
  }
}
