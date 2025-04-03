import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourtsListView extends StatelessWidget {
  const CourtsListView({super.key, this.Radious2});
  final double? Radious2;

  @override
  Widget build(BuildContext context) {
    ProductDetailsConimble productDetailsConimble =
        Get.put(ProductDetailsConimble());

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productDetailsConimble.items.courts!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GetBuilder<ProductDetailsConimble>(
          builder: (productDetailsConimble) {
            bool isSelected = productDetailsConimble.isClickedList[index];

            return InkWell(
              onTap: () {
                productDetailsConimble.ischosen(index);
                productDetailsConimble.chosencourtid =
                    productDetailsConimble.items.courts?[index].id.toString();
              },
              child: Container(
                width: AppConstans.Width * .4,
                height: AppConstans.Width * .2,
                decoration: BoxDecoration(
                  color: isSelected
                      ? (Get.isDarkMode
                          ? Color.fromARGB(255, 84, 97, 55)
                          : const Color.fromARGB(255, 233, 247, 203))
                      : (Get.isDarkMode
                          ? AppConstans.secondblackcolor
                          : AppConstans.Whitecolor),
                  borderRadius:
                      BorderRadius.circular(Radious2!), // Rounded corners
                  border: Border.all(
                    color: isSelected
                        ? Get.isDarkMode
                            ? AppConstans.maincolordarktheme
                            : AppConstans.maincolorlighttheme
                        : (Get.isDarkMode
                            ? AppConstans.Whitecolor
                            : AppConstans.Bordercolor),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstans.Hight * .015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Display court name
                      Expanded(
                        child: Center(
                          child: Text(
                            translationDataBase(
                              productDetailsConimble.items.courts?[index].name,
                              productDetailsConimble.items.courts?[index].name,
                            ),
                            style: TextStyleClass.getTextStyle(
                              "weight400",
                              16.sp,
                              color: Get.isDarkMode
                                  ? AppConstans.Whitecolor
                                  : AppConstans.blackcolor,
                            ),
                            overflow: TextOverflow.ellipsis, // Handle long text
                          ),
                        ),
                      ),
                      // Always reserve space for the cancel icon
                      Visibility(
                        visible: isSelected, // Show icon only if selected
                        child: Icon(
                          Icons.cancel,
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                          size: AppConstans.Width * .065,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
