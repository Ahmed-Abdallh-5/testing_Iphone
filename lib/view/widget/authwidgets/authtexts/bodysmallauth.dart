import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyAuth extends StatelessWidget {
  const BodyAuth({super.key, required this.authheadline});
  final String authheadline;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        authheadline,
        style: TextStyleClass.getTextStyle(
          "weight400",
          16.sp,
        ));
  }
}
