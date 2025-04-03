import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConatinerImage extends StatelessWidget {
  const ConatinerImage(
      {super.key, this.image, this.texts, this.index, this.hight, this.width});
  final List? image;
  final List? texts;
  final int? index;
  final double? hight;
  final double? width;

  @override
  Widget build(BuildContext context) {
    // Homeimp2 homeimp = Get.put(Homeimp2());
    return SizedBox(
      height: hight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: index,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Container(
            height: hight,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstans.Radious),
              color: Get.isDarkMode
                  ? Color.fromARGB(255, 106, 103, 106)
                  : const Color.fromARGB(255, 233, 247, 203),
            ),
            child: Stack(
              children: [
                Positioned(
                    right: 9.w,
                    top: 15.h,
                    child: Image.asset(
                      image![index],
                      width: 56.w,
                      height: 56.h,
                    )),
                Positioned(
                    top: 5.h, // 3% of screen height
                    left: 22.w, // 3% of screen width
                    child: Image.asset(
                      "images/Vector 13 (Stroke).png",
                    )),
                Positioned(
                  left: 8.w, // 2% of screen width
                  bottom: 5.h, // 2% of screen height
                  child: Text(
                    texts![index],
                    style: TextStyleClass.getTextStyle(
                      "weight600",
                      24.sp,
                      color: Get.isDarkMode == true
                          ? AppConstans.blackcolor
                          : AppConstans.darkgreycolor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
