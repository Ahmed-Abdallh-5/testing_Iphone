import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/tournmentmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournmentContainer extends StatelessWidget {
  const TournmentContainer(
      {super.key,
      this.Level,
      this.Tournmentname,
      this.date,
      this.playerleft,
      this.buttom1,
      this.buttom2,
      this.tournmentModel});

  final String? Tournmentname;

  final String? date;
  final String? Level;
  final int? playerleft;
  final Widget? buttom1;
  final Widget? buttom2;
  final TournmentModel? tournmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstans.Hight / 3.5,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Get.isDarkMode == true
              ? AppConstans.secondblackcolor
              : AppConstans.Whitecolor,
          borderRadius: BorderRadius.circular(AppConstans.Radious),
          border: Border.all(
            color: Get.isDarkMode == true
                ? AppConstans.darkgreycolor
                : AppConstans.Bordercolor,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  translationDataBase(
                      tournmentModel!.place!, tournmentModel!.place!),
                  style: TextStyleClass.getTextStyle(
                      "medium", AppConstans.Width * .055),
                ),
              ],
            ),
            SizedBox(
              height: AppConstans.Hight * .015,
            ),
            Row(children: [
              Image.asset(
                "images/Calendar.png",
                color: Get.isDarkMode == true
                    ? AppConstans.Whitecolor
                    : AppConstans.darkgreycolor,
              ),
              SizedBox(
                width: AppConstans.Width * .015,
              ),
              Text(
                date!,
                style: TextStyleClass.getTextStyle(
                    "weight500", AppConstans.Width * .03,
                    color: Get.isDarkMode == true
                        ? AppConstans.Whitecolor
                        : AppConstans.darkgreycolor),
              ),
            ]),
            SizedBox(
              height: AppConstans.Hight * .015,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(
                "images/Ranking.png",
                color: Get.isDarkMode == true
                    ? AppConstans.Whitecolor
                    : AppConstans.darkgreycolor,
              ),
              SizedBox(
                width: AppConstans.Width * .015,
              ),
              Text(
                tournmentModel!.level!,
                style: TextStyleClass.getTextStyle(
                    "weight500", AppConstans.Width * .03,
                    color: Get.isDarkMode == true
                        ? AppConstans.Whitecolor
                        : AppConstans.darkgreycolor),
              ),
              Spacer(),
              Image.asset("images/Users Group Rounded.png",
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme),
              SizedBox(
                width: AppConstans.Width * .015,
              ),
              Text(
                "${tournmentModel!.playersLeft} Players left",
                style: TextStyleClass.getTextStyle(
                    "weight500", AppConstans.Width * .03,
                    color: Get.isDarkMode
                        ? AppConstans.maincolordarktheme
                        : AppConstans.maincolorlighttheme),
              )
            ]),
            SizedBox(
              height: AppConstans.Hight * .015,
            ),
            Row(
              children: [buttom1!, Spacer(), buttom2!],
            )
          ],
        ),
      ),
    );
  }
}
