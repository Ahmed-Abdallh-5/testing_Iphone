import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmenitiesListView extends StatelessWidget {
  const AmenitiesListView(
      {super.key, this.Radious, this.minWidth, this.image, this.text});
  final double? minWidth;
  final double? Radious;
  final String? image;
  final String? text;
  @override
  Widget build(BuildContext context) {
    ProductDetailsConimble productDetailsConimble =
        Get.put(ProductDetailsConimble());
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productDetailsConimble.items.amenities!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          constraints: BoxConstraints(minWidth: minWidth!),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Radious!),
            border: Border.all(
              color: Get.isDarkMode == true
                  ? AppConstans.darkgreycolordarktheme
                  : AppConstans.Bordercolor,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  translationDataBase(
                      productDetailsConimble.items.amenities?[index],
                      productDetailsConimble.items.amenities?[index]),
                  style: TextStyleClass.getTextStyle(
                    "medium",
                    AppConstans.Width * .04,
                    color: Get.isDarkMode == true
                        ? AppConstans.darkgreycolordarktheme
                        : AppConstans.darkgreycolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
