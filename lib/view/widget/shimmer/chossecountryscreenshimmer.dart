import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';

class ShimmerChooseCountry extends StatelessWidget {
  const ShimmerChooseCountry({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.white12 : Colors.grey.shade300,
      highlightColor: isDarkMode ? Colors.white24 : Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: AppConstans.distanceapppar),
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: AppConstans.Whitecolor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 24),
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: AppConstans.Whitecolor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Spacer(),
            Container(
              height: screenHeight * 0.065,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: AppConstans.Whitecolor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: AppConstans.distancefrombottombar),
          ],
        ),
      ),
    );
  }
}
