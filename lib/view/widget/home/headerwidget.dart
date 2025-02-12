import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/iconstacck.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RowHomeScreen extends StatelessWidget {
  const RowHomeScreen({
    super.key,
    this.icons,
    this.text,
    this.onTap,
  });

  final IconData? icons;
  final String? text;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text!,
          style:
              TextStyleClass.getTextStyle("medium", AppConstans.Width * .053),
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ),
      ],
    );
  }
}
