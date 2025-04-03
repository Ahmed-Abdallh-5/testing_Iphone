import 'package:ecommerce/controller/tornmentcon/tournmentcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/model/tournmentmodel.dart';
import 'package:ecommerce/view/screens/tournment/sharedchoicebuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TournmentContainer extends StatelessWidget {
  const TournmentContainer({
    super.key,
    this.Level,
    this.Tournmentname,
    this.playerleft,
    this.tournmentModel,
  });

  final String? Tournmentname;
  final String? Level;
  final int? playerleft;
  final TournmentModel? tournmentModel;

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    Tournmentconimble tournmentconimble = Get.put(Tournmentconimble());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
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
        mainAxisSize: MainAxisSize.min, // يجعل الارتفاع يعتمد على المحتوى
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                translationDataBase(
                    tournmentModel!.placeAr!, tournmentModel!.placeEn!),
                style: TextStyleClass.getTextStyle(
                    "medium", AppConstans.Width * .055),
              ),
            ],
          ),
          SizedBox(height: AppConstans.Hight * .015),
          Row(children: [
            Image.asset(
              "images/Calendar.png",
              color: Get.isDarkMode
                  ? AppConstans.Whitecolor
                  : AppConstans.darkgreycolor,
            ),
            SizedBox(width: AppConstans.Width * .015),
            Text(
              DateFormat("d MMMM y - hh:mm a",
                      settingservices.sharedPref.getString("lang"))
                  .format(DateTime.parse(tournmentModel!.date!)),
              style: TextStyleClass.getTextStyle(
                  "weight500", AppConstans.Width * .03,
                  color: Get.isDarkMode
                      ? AppConstans.Whitecolor
                      : AppConstans.darkgreycolor),
            ),
          ]),
          SizedBox(height: AppConstans.Hight * .015),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              "images/Ranking.png",
              color: Get.isDarkMode
                  ? AppConstans.Whitecolor
                  : AppConstans.darkgreycolor,
            ),
            SizedBox(width: AppConstans.Width * .015),
            Text(
              tournmentModel!.level!,
              style: TextStyleClass.getTextStyle(
                  "weight500", AppConstans.Width * .03,
                  color: Get.isDarkMode
                      ? AppConstans.Whitecolor
                      : AppConstans.darkgreycolor),
            ),
            Spacer(),
            Image.asset("images/Users Group Rounded.png",
                color: Get.isDarkMode
                    ? AppConstans.maincolordarktheme
                    : AppConstans.maincolorlighttheme),
            SizedBox(width: AppConstans.Width * .015),
            Text(
              "${tournmentModel!.playersLeft} " + "350".tr,
              style: TextStyleClass.getTextStyle(
                  "weight500", AppConstans.Width * .03,
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme),
            )
          ]),
          SizedBox(height: AppConstans.Hight * .015),
          Row(
            children: [
              ChoiceButtom(
                iscolored: true,
                text1: true,
                text2: "348".tr,
                onPressed: () async {
                  tournmentconimble.jointournament(tournmentModel!.id!);
                },
              ),
              Spacer(),
              ChoiceButtom(
                iscolored: false,
                text1: false,
                text3: "349".tr,
                onPressed: () {
                  tournmentconimble.gototournamentdetailscreen(tournmentModel!);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
