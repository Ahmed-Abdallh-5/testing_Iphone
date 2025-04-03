import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(
      {super.key, this.photostring, this.maintext, this.subtext});
  final String? photostring;
  final String? maintext;
  final String? subtext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 525.h,
            width: 650.w,
            child: Image.asset(
              photostring!,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 35.h),
          Text(
            maintext!,
            textAlign: TextAlign.center,
            style: TextStyleClass.getTextStyle(
              "medium",
              32.sp,

              // color: Get.isDarkMode == true ?
              // Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64.w),
            child: Text(
              subtext!,
              textAlign: TextAlign.center,
              style: TextStyleClass.getTextStyle(
                "regular",
                24.sp,
                color: Get.isDarkMode == true
                    ? AppConstans.Whitecolor
                    : AppConstans.darkgreycolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
