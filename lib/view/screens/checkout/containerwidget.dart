import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: AppConstans.Hight / 5.2,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  maintitle!,
                  style: TextStyleClass.getTextStyle(
                      "medium", AppConstans.Width * .05),
                ),
                SizedBox(
                  height: AppConstans.Hight * .015,
                ),
                Text(
                  secondtitle!,
                  style: TextStyleClass.getTextStyle(
                      "weight500", AppConstans.Width * .035),
                ),
                SizedBox(
                  height: AppConstans.Hight * .015,
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
                      thirdtitle!,
                      style: TextStyleClass.getTextStyle(
                          "weight500", AppConstans.Width * .028),
                    ),
                    Text(
                      Sunthirdtitle!,
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
                    SizedBox(
                      width: AppConstans.Width * .015,
                    ),
                    Text(
                      fourthtitle!,
                      style: TextStyleClass.getTextStyle(
                          "weight500", AppConstans.Width * .028),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
            Spacer(),
            isbool == true
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstans.Width / 40,
                        vertical: AppConstans.Hight / 120),
                    child: Container(
                      height: AppConstans.Hight * .15,
                      width: AppConstans.Width * .005,
                      color: AppConstans.darkgreycolor,
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            Spacer(),
            isbool == true
                ? Center(
                    child: Text(
                      "800 EGP",
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}
