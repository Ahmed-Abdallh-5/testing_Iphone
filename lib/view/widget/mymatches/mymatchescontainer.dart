import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/history.dart';
import 'package:ecommerce/data/model/upcoming.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMatchesContainer extends StatelessWidget {
  const MyMatchesContainer(
      {super.key,
      this.history,
      this.upcomingModel,
      this.hight,
      this.ishistrory = false});
  final HistoryModel? history;
  final UpcomingModel? upcomingModel;
  final bool ishistrory;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstans.PaddingHorizontalAuth,
      ),
      child: Column(
        children: [
          SizedBox(
            height: AppConstans.PaddingHorizontalAuth,
          ),
          Container(
            height: hight,
            width: AppConstans.Width,
            decoration: BoxDecoration(
              color: Get.isDarkMode == true
                  ? AppConstans.secondblackcolor
                  : AppConstans.Whitecolor,
              borderRadius: BorderRadius.circular(AppConstans.Radious),
              border: Border.all(
                color: Get.isDarkMode == true
                    ? AppConstans.darkgreycolor
                    : AppConstans.Bordercolor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ishistrory == true
                        ? translationDataBase(
                            history!.placeNameAr, history!.placeName)
                        : translationDataBase(
                            upcomingModel!.placeNameAr,
                            upcomingModel!.placeName,
                          ),
                    style: TextStyleClass.getTextStyle(
                        "medium", AppConstans.Width * .05),
                  ),
                  SizedBox(
                    height: AppConstans.Hight * .01,
                  ),
                  Text(
                    ishistrory == true
                        ? translationDataBase(
                            history!.courtName, history!.courtName)
                        : translationDataBase(
                            upcomingModel!.courtName, upcomingModel!.courtName),
                    style: TextStyleClass.getTextStyle(
                        "weight400", AppConstans.Width * .035),
                  ),
                  SizedBox(
                    height: AppConstans.Hight * .01,
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
                        width: AppConstans.Width * .015,
                      ),
                      Text(
                        "Monday 3 Oct ,07:00 PM - 9:00 PM",
                        style: TextStyleClass.getTextStyle(
                            "weight500", AppConstans.Width * .028),
                      ),
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
                      Text(
                        "  120 min ",
                        style: TextStyleClass.getTextStyle(
                            "weight500", AppConstans.Width * .028),
                      ),
                      Spacer(),
                      Text(
                        ishistrory ? "${history!.amount!.toInt()} EGP" : "",
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
                    ],
                  ),
                  ishistrory
                      ? SizedBox()
                      :
                      // SizedBox(
                      //     height: AppConstans.Hight * .015,
                      //   ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: AppConstans.Hight * .015,
                            ),
                            Container(
                              height: 2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? AppConstans.darkgreycolor
                                      : AppConstans.Bordercolor),
                            ),
                            SizedBox(
                              height: AppConstans.Hight * .015,
                            ),
                            Text(
                              "${upcomingModel!.amount!.toInt()} EGP",
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
                          ],
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
