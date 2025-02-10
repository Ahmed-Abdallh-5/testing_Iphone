import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimtedIndicator extends StatelessWidget {
  const AnimtedIndicator({super.key, required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 3,
      effect: WormEffect(
        dotColor: Color.fromARGB(255, 234, 243, 255),
        activeDotColor: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,
        dotWidth: 12,
        dotHeight: 12,
        spacing: 10,
      ),
    );
  }
}
