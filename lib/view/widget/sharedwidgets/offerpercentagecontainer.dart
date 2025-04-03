import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OfferConatinerPercentage extends StatelessWidget {
  const OfferConatinerPercentage({super.key, this.discount});
  final int? discount;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppConstans.Radious),
            bottomRight: Radius.circular(AppConstans.Radious),
            topRight: Radius.circular(AppConstans.Radious),
          ),
          child: Container(
            height: 24.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? AppConstans.maincolordarktheme
                    : AppConstans.maincolorlighttheme),
            child: Center(
                child: Text(
              "${discount}% Off",
              style: TextStyleClass.getTextStyle("weight500", 12.sp,
                  color: AppConstans.Whitecolor),
            )),
          )),
    );
  }
}
