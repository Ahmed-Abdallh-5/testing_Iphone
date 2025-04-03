import 'package:ecommerce/controller/tornmentcon/tournamentdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/screens/tournment/badge.dart';
import 'package:ecommerce/view/screens/tournment/titletournamentdetails.dart';
import 'package:ecommerce/view/screens/tournment/tornamentdetailstexts.dart';
import 'package:ecommerce/view/widget/containericonbuttom.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TornamentDetailsScreen extends StatelessWidget {
  const TornamentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    TournmentDeailsconimble tournmentDeailsconimble =
        Get.put(TournmentDeailsconimble());
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: AppConstans.PaddingHorizontalAuth,
            right: AppConstans.PaddingHorizontalAuth,
            bottom: AppConstans.Hight * .015,
          ),
          child: MaterialFixedButtom(
            isrowed: true,
            isEnabled: true,
            text: "348".tr,
            onPressed: () async {
              await tournmentDeailsconimble
                  .jointournament(tournmentDeailsconimble.tournmentModel!.id!);
            },
          )),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: AppConstans.Hight / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                        bottom: Radius.circular(25)),
                    border: Border.all()),
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.vertical(
                      bottom: Radius.circular(AppConstans.Radious)),
                  child: Image.asset(
                    "images/padelOriginal.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: AppConstans.PaddingHorizontalAuth,
                  left: AppConstans.PaddingHorizontalAuth,
                  top: AppConstans.PaddingHorizontalAuth,
                ),
                child: ContainerIconButtom(
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstans.PaddingHorizontalAuth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TournamentDetailsTexts(
                    tournamentname:
                        tournmentDeailsconimble.tournmentModel.title,
                    placename: translationDataBase(
                        tournmentDeailsconimble.tournmentModel.placeAr,
                        tournmentDeailsconimble.tournmentModel.placeAr),
                    date: DateFormat("d MMMM y - hh:mm a",
                            settingservices.sharedPref.getString("lang"))
                        .format(DateTime.parse(
                            tournmentDeailsconimble.tournmentModel.date!)),
                    Level: tournmentDeailsconimble.tournmentModel.level,
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 30,
                  ),
                  Container(
                    height: AppConstans.Hight / 14,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppConstans.Radious),
                        border: Border.all(
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                        ),
                        color: Get.isDarkMode == true
                            ? AppConstans.secondblackcolor
                            : AppConstans.Whitecolor),
                    child: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          "images/Let's go.png",
                          // height: 30,
                          // width: 30,
                        ),
                        Spacer(),
                        Text(
                          "Team up for the win! only ${tournmentDeailsconimble.tournmentModel!.playersLeft} spots left",
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 30,
                  ),
                  TournamentDetailsTitle(
                    title: "354".tr,
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 30,
                  ),
                  Container(
                    height: AppConstans.Hight / 11,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppConstans.Radious),
                        border: Border.all(
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                        ),
                        color: Get.isDarkMode == true
                            ? AppConstans.secondblackcolor
                            : AppConstans.Whitecolor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BadgeWithText(
                            text2: "1st",
                            imagePath: "images/RANK BADGES.png",
                            text: tournmentDeailsconimble
                                .tournmentModel.prizes!.i1st
                                .toString(),
                          ),
                          Spacer(),
                          BadgeWithText(
                            text2: "2st",
                            imagePath: "images/RANK BADGES (1).png",
                            text: tournmentDeailsconimble
                                .tournmentModel!.prizes!.i2nd
                                .toString(),
                          ),
                          Spacer(),
                          BadgeWithText(
                            text2: "3st",
                            imagePath: "images/RANK BADGES (2).png",
                            text: tournmentDeailsconimble
                                .tournmentModel!.prizes!.i3rd
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 30,
                  ),
                  TournamentDetailsTitle(
                    title: "355".tr,
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 30,
                  ),
                  Row(
                    children: [
                      Text(
                        tournmentDeailsconimble.tournmentModel.fee.toString() +
                            " " +
                            "364".tr,
                        style: TextStyleClass.getTextStyle(
                          "weight500",
                          AppConstans.Hight / 40,
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "356".tr,
                        style: TextStyleClass.getTextStyle(
                            "weight500", AppConstans.Hight / 55),
                      ),
                    ],
                  )
                ],
              )),
          SizedBox(
            height: AppConstans.Hight / 30,
          ),
        ],
      ),
    );
  }
}
