import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer(
      {super.key,
      this.hight,
      this.Radious,
      this.maintitle,
      this.secondtitle,
      this.thirdtitle,
      this.fourthtitle,
      this.Sunthirdtitle,
      this.price,
      this.isbool = true});
  final double? hight;
  final double? Radious;
  final String? maintitle;
  final String? secondtitle;
  final String? thirdtitle;
  final String? Sunthirdtitle;
  final int? price;
  final String? fourthtitle;
  final isbool;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.isDarkMode == true
            ? AppConstans.secondblackcolor
            : AppConstans.Whitecolor,
        borderRadius: BorderRadius.circular(Radious!),
        border: Border.all(
          color: Get.isDarkMode == true
              ? AppConstans.darkgreycolor
              : AppConstans.Bordercolor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstans.PaddingHorizontalAuth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maintitle!,
                      style: TextStyleClass.getTextStyle("medium", 20.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      secondtitle!,
                      style: TextStyleClass.getTextStyle("weight500", 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/Calendar.png",
                          color: Get.isDarkMode == true
                              ? AppConstans.Whitecolor
                              : null,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          thirdtitle!,
                          style:
                              TextStyleClass.getTextStyle("weight500", 12.sp),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        // Text(
                        //   Sunthirdtitle!,
                        //   style: TextStyleClass.getTextStyle(
                        //     "weight500",
                        //     AppConstans.Width * .028,
                        //   ),
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 1,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: AppConstans.Hight * .015,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/History 2.png",
                          color: Get.isDarkMode == true
                              ? AppConstans.Whitecolor
                              : null,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          fourthtitle!,
                          style:
                              TextStyleClass.getTextStyle("weight500", 12.sp),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: isbool == true ? 24.w : 88,
                    ),
                  ],
                ),
                Spacer(),
                isbool == true
                    ?
                    // SizedBox(width: AppConstans.commonsizeboxhiggt,),
                    Container(
                        height: 112.h,
                        width: 2.w,
                        color: AppConstans.darkgreycolor,
                      )
                    : SizedBox(
                        height: 0,
                      ),
                Spacer(),
                isbool == true
                    ? Center(
                        child: Text(
                          "800 " + "364".tr,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyleClass.getTextStyle(
                            "weight500",
                            AppConstans.Width * .048,
                            color: Get.isDarkMode
                                ? AppConstans.maincolordarktheme
                                : AppConstans.maincolorlighttheme,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ],
            ),

            // // Spacer(),
            // // Spacer(),

            // Spacer(),

            // Spacer(),
          ],
        ),
      ),
    );
  }
}
