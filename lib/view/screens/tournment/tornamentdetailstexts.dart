import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentDetailsTexts extends StatelessWidget {
  const TournamentDetailsTexts(
      {super.key, this.tournamentname, this.placename, this.date, this.Level});
  final String? tournamentname;
  final String? placename;
  final String? date;
  final String? Level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          tournamentname!,
          style:
              TextStyleClass.getTextStyle("medium", AppConstans.Width * .055),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme,
                ),
                Text(
                  placename!,
                  style: TextStyleClass.getTextStyle(
                    "weight400",
                    AppConstans.Width * .048,
                    color: Get.isDarkMode
                        ? AppConstans.maincolordarktheme
                        : AppConstans.maincolorlighttheme,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/Calendar.png",
                          color: Get.isDarkMode == true
                              ? AppConstans.Whitecolor
                              : AppConstans.darkgreycolor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          date!,
                          style: TextStyleClass.getTextStyle(
                              "weight500", AppConstans.Width * .035,
                              color: Get.isDarkMode == true
                                  ? AppConstans.Whitecolor
                                  : AppConstans.darkgreycolor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/Ranking.png",
                          color: Get.isDarkMode == true
                              ? AppConstans.Whitecolor
                              : AppConstans.darkgreycolor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          Level!,
                          style: TextStyleClass.getTextStyle(
                              "weight500", AppConstans.Width * .035,
                              color: Get.isDarkMode == true
                                  ? AppConstans.Whitecolor
                                  : AppConstans.darkgreycolor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
