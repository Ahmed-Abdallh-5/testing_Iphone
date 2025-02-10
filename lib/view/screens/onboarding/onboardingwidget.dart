import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/screens/onboarding/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(
      {super.key, this.photostring, this.maintext, this.subtext});
  final String? photostring;
  final String? maintext;
  final String? subtext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: AppConstans.Hight / 1.6,
              width: double.infinity,
              child: Image.asset(
                photostring!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SizedBox(height: 20),
          Text(
            maintext!,
            textAlign: TextAlign.center,
            style: TextStyleClass.getTextStyle(
              "medium",
              AppConstans.Width * 0.08,

              // color: Get.isDarkMode == true ?
              // Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstans.Width * 0.1),
            child: Text(
              subtext!,
              textAlign: TextAlign.center,
              style: TextStyleClass.getTextStyle(
                "weight400",
                AppConstans.Width * 0.05,
                color: Get.isDarkMode == true
                    ? AppConstans.Whitecolor
                    : AppConstans.darkgreycolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
