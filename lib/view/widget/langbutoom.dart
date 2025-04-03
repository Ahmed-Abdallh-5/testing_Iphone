import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LangButton extends StatelessWidget {
  const LangButton({
    super.key,
    this.langname,
    this.onpressLangChange,
    this.height,
  });

  final String? langname;
  final double? height;
  final Function()? onpressLangChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.w),
      child: SizedBox(
        height: height ?? 50.h,
        width: double.infinity,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstans.Radious)),
          onPressed: onpressLangChange,
          color: Get.isDarkMode
              ? AppConstans.maincolordarktheme
              : AppConstans.maincolorlighttheme,
          child: Center(
            child: Text(
              langname ?? '',
              style: TextStyleClass.getTextStyle("medium", 20.sp,
                  color: AppConstans.Whitecolor),
            ),
          ),
        ),
      ),
    );
  }
}
