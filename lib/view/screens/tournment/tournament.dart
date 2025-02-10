import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/screens/tournment/badge.dart';
import 'package:ecommerce/view/screens/tournment/titletournamentdetails.dart';
import 'package:ecommerce/view/screens/tournment/tornamentdetailstexts.dart';
import 'package:ecommerce/view/widget/containericonbuttom.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TornamentDetailsScreen extends StatelessWidget {
  const TornamentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            text: "I'm in",
            onPressed: () async {},
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
                      bottom: Radius.circular(16)),
                  child: Image.asset(
                    "images/image.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: AppConstans.PaddingHorizontal,
                  left: AppConstans.PaddingHorizontal,
                  top: AppConstans.PaddingHorizontal,
                ),
                child: ContainerIconButtom(
                  onPressed: () {
                    Get.back();
                  },
                  name: "images/Alt Arrow Left.png",
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
                    tournamentname: "Padel playoff tournament",
                    placename: "Padel station",
                    date: "Friday 25 Oct. 10:00PM",
                    Level: "Beginner Level",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: AppConstans.Hight / 14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
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
                        Image.asset(
                          "images/Let's go.png",
                          // height: 30,
                          // width: 30,
                        ),
                        Spacer(),
                        Text(
                          "Team up for the win! only 25 spots left",
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share_outlined,
                              color: Get.isDarkMode
                                  ? AppConstans.maincolordarktheme
                                  : AppConstans.maincolorlighttheme,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TournamentDetailsTitle(
                    title: "Tournament prizes",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: AppConstans.Hight / 11,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
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
                            text: "1500",
                          ),
                          Spacer(),
                          BadgeWithText(
                            text2: "2st",
                            imagePath: "images/RANK BADGES (1).png",
                            text: "900",
                          ),
                          Spacer(),
                          BadgeWithText(
                            text2: "3st",
                            imagePath: "images/RANK BADGES (2).png",
                            text: "700",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TournamentDetailsTitle(
                    title: "Tournament entry fee",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        "300 EGP",
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
                        "Pay directly at the court",
                        style: TextStyleClass.getTextStyle(
                            "weight500", AppConstans.Hight / 55),
                      ),
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
