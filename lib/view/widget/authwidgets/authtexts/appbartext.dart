import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';

class Appbartext extends StatelessWidget {
  const Appbartext({super.key, required this.appbartext});
  final String appbartext;
  @override
  Widget build(BuildContext context) {
    return Text(
      appbartext,
      style: TextStyleClass.getTextStyle("medium", AppConstans.Width * .05),
    );
  }
}
