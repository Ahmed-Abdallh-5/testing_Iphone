import 'package:ecommerce/controller/onboarding/onboardingcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/screens/onboarding/customindicator.dart';
import 'package:ecommerce/view/screens/onboarding/onboardingwidget.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingConimble onboardingConimble = Get.put(OnboardingConimble());
    PageController pageController = PageController();

    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                onboardingConimble.changeindex(value);
              },
              controller: pageController,
              children: [
                OnboardingWidget(
                  photostring: "images/image 11.png",
                  maintext: "4".tr,
                  subtext: "5".tr,
                ),
                OnboardingWidget(
                  photostring: "images/image 12.png",
                  maintext: "6".tr,
                  subtext: "7".tr,
                ),
                OnboardingWidget(
                  photostring: "images/image 13.png",
                  maintext: "8".tr,
                  subtext: "9".tr,
                ),

                // Add more screens as needed
              ],
            ),
          ),
          // const SizedBox(height: 10), // Space between PageView and indicators
          // Indicators Row

          GetBuilder<OnboardingConimble>(
            builder: (onboardingConimble) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeContainer(
                  isactive: onboardingConimble.index == 0 ? true : false,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomeContainer(
                  isactive: onboardingConimble.index == 1 ? true : false,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomeContainer(
                  isactive: onboardingConimble.index == 2 ? true : false,
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppConstans.Hight / 22,
          ),
          // Space between indicators and button
          // // Shared Button
          // const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstans.PaddingHorizontalAuth),
            child: Sharedbuttom(
              text: "10".tr,
              hight: AppConstans.Hight * 0.065,
              onpreesed: () {
                onboardingConimble.gotosignup();
              },
            ),
          ),
          SizedBox(height: AppConstans.Hight / 45),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "142".tr,
                style: TextStyleClass.getTextStyle(
                  "weight400",
                  AppConstans.Width / 25,
                  color: Get.isDarkMode == true
                      ? AppConstans.Whitecolor
                      : AppConstans.darkgreycolor,
                ),
              ),
              TextDectecot(
                  text: "11".tr,
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme,
                  ontap: () {
                    onboardingConimble.gotologinscreen();
                  })
            ],
          ),

          SizedBox(height: AppConstans.Hight / 25),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100); // Adjust starting point of the curve
    path.quadraticBezierTo(size.width / 2, size.height + 50, size.width,
        size.height - 100); // Deeper curve
    path.lineTo(size.width, 0); // Top-right
    path.close(); // Connect to the start
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
