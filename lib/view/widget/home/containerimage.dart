import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.only(right: AppConstans.Width * 0.05),
          child: Container(
            height: hight,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstans.Radious),
              color: const Color.fromARGB(255, 233, 247, 203),
            ),
            child: Stack(
              children: [
                Positioned(
                    right: AppConstans.Width * 0.03,
                    top: AppConstans.Width * 0.03,
                    child: Image.asset(image![index])),
                Positioned(
                    top: AppConstans.Hight * 0.03, // 3% of screen height
                    left: AppConstans.Width * 0.03, // 3% of screen width
                    child: Image.asset(
                      "images/Vector 13 (Stroke).png",
                    )),
                Positioned(
                  left: AppConstans.Width * 0.02, // 2% of screen width
                  bottom: AppConstans.Hight * 0.02, // 2% of screen height
                  child: Text(
                    texts![index],
                    style: TextStyleClass.getTextStyle(
                      "medium",
                      AppConstans.Hight * 0.03,
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
