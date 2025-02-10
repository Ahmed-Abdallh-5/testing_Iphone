import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrText extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const OrText(
      {super.key, this.padding = const EdgeInsets.symmetric(horizontal: 16)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding, // Use customizable padding
      child: Row(
        children: [
          // Flexible divider line
          Flexible(
            child: Container(
              height: AppConstans.Hight / 500,
              color: const Color.fromARGB(135, 144, 144, 144),
            ),
          ),
          SizedBox(
            width: AppConstans.Width / 20,
          ),
          // "OR" text
          Text(
            "69".tr,
            style: TextStyleClass.getTextStyle(
              "weight400",
              AppConstans.Width / 25,
              color: const Color.fromARGB(255, 144, 144, 144),
            ),
          ),
          SizedBox(
            width: AppConstans.Width / 20,
          ),
          // Flexible divider line
          Flexible(
            child: Container(
              height: AppConstans.Hight / 500,
              color: const Color.fromARGB(135, 144, 144, 144),
            ),
          ),
        ],
      ),
    );
  }
}
