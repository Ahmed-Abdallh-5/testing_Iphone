import 'package:ecommerce/core/constans/textstyles/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeadLinesmall extends StatelessWidget {
  const AuthHeadLinesmall({super.key, required this.authheadline});
  final String authheadline;
  @override
  Widget build(BuildContext context) {
    return Text(
      authheadline,
      textAlign: TextAlign.center,
      style: TextStyleClass.getTextStyle("Bold", 28.sp),
    );
  }
}
