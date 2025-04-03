import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/history.dart';
import 'package:ecommerce/data/model/upcoming.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyMatchesContainer extends StatelessWidget {
  const MyMatchesContainer({
    super.key,
    this.history,
    this.upcomingModel,
    this.isprice = true,
    this.width = double.infinity,
    this.ishorizonal = false,
    this.ishistrory = false,
  });

  final HistoryModel? history;
  final UpcomingModel? upcomingModel;
  final bool ishistrory;
  final double width;
  final bool? isprice;
  final bool ishorizonal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ishorizonal ? 0 : 24.h),
      child: Container(
        width: width, // العرض ثابت
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? AppConstans.secondblackcolor
              : AppConstans.Whitecolor,
          borderRadius: BorderRadius.circular(AppConstans.Radious),
          border: Border.all(
            color: Get.isDarkMode
                ? AppConstans.darkgreycolor
                : AppConstans.Bordercolor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // يجعل الارتفاع حسب المحتوى فقط
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم المكان
            Text(
              ishistrory
                  ? translationDataBase(
                      history!.placeNameAr, history!.placeName)
                  : translationDataBase(
                      upcomingModel!.placeNameAr, upcomingModel!.placeName),
              style: TextStyleClass.getTextStyle("medium", 20.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 8.h),

            // اسم الملعب
            Text(
              ishistrory
                  ? translationDataBase(history!.courtName, history!.courtName)
                  : translationDataBase(
                      upcomingModel!.courtName, upcomingModel!.courtName),
              style: TextStyleClass.getTextStyle("weight500", 12.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 11.h),

            // التاريخ والوقت
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "images/Calendar.png",
                  color: Get.isDarkMode ? AppConstans.Whitecolor : null,
                ),
                SizedBox(width: 8.w),
                Text(
                  ishistrory
                      ? "${history!.date}   ${"362".tr}  ${history!.from}  ${"363".tr}  ${history!.to}"
                      : "${upcomingModel!.date}   ${"362".tr}  ${upcomingModel!.from}  ${"363".tr}  ${upcomingModel!.to}",
                  style: TextStyleClass.getTextStyle("weight500", 12.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // المدة والسعر
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "images/History 2.png",
                  color: Get.isDarkMode ? AppConstans.Whitecolor : null,
                ),
                SizedBox(width: 5.w),
                Text(
                  "120 min",
                  style: TextStyleClass.getTextStyle("weight500", 12.sp),
                ),
                Spacer(),
                if (ishistrory)
                  Text(
                    "${history!.amount!.toInt()} EGP",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyleClass.getTextStyle(
                      "weight500",
                      20.sp,
                      color: Get.isDarkMode
                          ? AppConstans.maincolordarktheme
                          : AppConstans.maincolorlighttheme,
                    ),
                  ),
              ],
            ),

            // فاصل وسعر الحجز المستقبلي
            if (!ishistrory && !ishorizonal) ...[
              SizedBox(height: 19.h),
              Container(
                height: 1.5.h,
                width: double.infinity,
                color: Get.isDarkMode
                    ? AppConstans.darkgreycolor
                    : AppConstans.Bordercolor,
              ),
              SizedBox(height: 10.h),
              if (isprice == true)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${upcomingModel!.amount!.toInt()} EGP",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyleClass.getTextStyle(
                      "weight500",
                      20.sp,
                      color: Get.isDarkMode
                          ? AppConstans.maincolordarktheme
                          : AppConstans.maincolorlighttheme,
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
