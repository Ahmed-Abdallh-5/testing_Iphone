import 'package:ecommerce/controller/onboarding/onboardingcon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/widget/onbording/customindicator.dart';
import 'package:ecommerce/view/widget/onbording/onboardingwidget.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:ecommerce/view/widget/textgesondetector.dart/textgesondetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingConimble onboardingConimble = Get.put(OnboardingConimble());
    PageController pageController = PageController();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // Ensures full use of available space
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
              ],
            ),
          ),

          // SizedBox(height: 52.h),
          GetBuilder<OnboardingConimble>(
            builder: (onboardingConimble) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeContainer(isactive: onboardingConimble.index == 0),
                SizedBox(width: 4.w),
                CustomeContainer(isactive: onboardingConimble.index == 1),
                SizedBox(width: 4.w),
                CustomeContainer(isactive: onboardingConimble.index == 2),
              ],
            ),
          ),

          // Remove this unnecessary space
          SizedBox(height: 40.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Sharedbuttom(
              text: "10".tr,
              hight: 48.h,
              onpreesed: () {
                onboardingConimble.gotosignup();
              },
            ),
          ),
          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "142".tr,
                style: TextStyleClass.getTextStyle(
                  "weight400",
                  16.sp,
                  color: Get.isDarkMode
                      ? const Color.fromARGB(255, 227, 227, 227)
                      : AppConstans.darkgreycolor,
                ),
              ),
              TextDectecot(
                text: "11".tr,
                fontsize: 16.sp,
                color: Get.isDarkMode
                    ? AppConstans.maincolordarktheme
                    : AppConstans.maincolorlighttheme,
                ontap: () {
                  onboardingConimble.gotologinscreen();
                },
              ),
            ],
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
