import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';

class SettingScreenText extends StatelessWidget {
  const SettingScreenText({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyleClass.getTextStyle(
        "Regular",
        AppConstans.Width * .05,
      ),
    );
  }
}
