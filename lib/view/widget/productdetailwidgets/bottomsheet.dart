import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/view/widget/sharedwidgets/noitemtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MaterialBottomSheet extends StatelessWidget {
  const MaterialBottomSheet({super.key, this.Mainbottomsheettext});
  final String? Mainbottomsheettext;

  @override
  Widget build(BuildContext context) {
    ProductDetailsConimble productDetailsConimble =
        Get.put(ProductDetailsConimble());

    return Container(
      height: AppConstans.Hight / 2,
      width: double.infinity,
      child: Material(
        color: Get.isDarkMode == true
            ? AppConstans.secondblackcolor
            : AppConstans.Whitecolor,
        borderRadius: BorderRadius.circular(AppConstans.Radious),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin:
                    EdgeInsets.only(top: AppConstans.commonsizeboxhiggt / 3),
                height: 5.h,
                width: 36.w,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 192, 192, 194),
                  borderRadius: BorderRadius.circular(AppConstans.Radious),
                ),
              ),
            ),
            SizedBox(
              height: AppConstans.commonsizeboxhiggt,
            ),
            Center(
              child: Text(
                Mainbottomsheettext!,
                style: TextStyleClass.getTextStyle(
                  "weight600",
                  18.sp,
                ),
              ),
            ),
            SizedBox(
              height: AppConstans.commonsizeboxhiggt,
            ),
            productDetailsConimble.AvilableHoursList.length == 0
                ? Center(
                    child: NoItemText(
                      effectiveWidth: 18.sp,
                      text: "376".tr,
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 columns
                          mainAxisSpacing: 8.h, // Spacing between rows
                          crossAxisSpacing: 8.w, // Spacing between columns
                          childAspectRatio:
                              3.r, // Adjust to control the item size
                        ),
                        itemCount:
                            productDetailsConimble.AvilableHoursList.length,
                        itemBuilder: (context, index) {
                          // final time = productDetailsConimble.AvilableHoursList[index];

                          return GetBuilder<ProductDetailsConimble>(
                              builder: (productDetailsConimble) => InkWell(
                                  onTap: () {
                                    if (productDetailsConimble.ChosenHoursList
                                        .contains(productDetailsConimble
                                            .AvilableHoursList[index]
                                            .split(" - ")[0])) {
                                      // print(productDetailsConimble.ChosenHoursList);
                                      productDetailsConimble
                                          .RemoveFromBookedlist(
                                              productDetailsConimble
                                                  .AvilableHoursList[index]
                                                  .split(" - ")[0]);

                                      print("removed");

                                      print(productDetailsConimble
                                          .ChosenHoursList);
                                    } else {
                                      productDetailsConimble.AddtoBookedlist(
                                          productDetailsConimble
                                              .AvilableHoursList[index]
                                              .split(" - ")[0]);
                                      print("added");
                                      print(productDetailsConimble
                                          .ChosenHoursList);
                                    }
                                  },
                                  child: productDetailsConimble.ChosenHoursList
                                              .contains(productDetailsConimble
                                                  .AvilableHoursList[index]
                                                  .split(" - ")[0]) ==
                                          false
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppConstans.Radious),
                                            border: Border.all(
                                              color: Get.isDarkMode == true
                                                  ? AppConstans.darkgreycolor
                                                  : const Color.fromARGB(
                                                      255, 0, 0, 0),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              productDetailsConimble
                                                  .AvilableHoursList[index]
                                                  .toString()
                                                  .substring(0, 8),
                                              style:
                                                  TextStyleClass.getTextStyle(
                                                      "weight400", 16.sp),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Get.isDarkMode == true
                                                ? Color.fromARGB(
                                                    255, 84, 97, 55)
                                                : const Color.fromARGB(
                                                    255, 233, 247, 203),
                                            borderRadius: BorderRadius.circular(
                                                AppConstans.Radious),
                                            border: Border.all(
                                                color: Get.isDarkMode == true
                                                    ? AppConstans
                                                        .maincolordarktheme
                                                    : AppConstans
                                                        .maincolorlighttheme),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  productDetailsConimble
                                                      .AvilableHoursList[index]
                                                      .toString()
                                                      .substring(0, 8),
                                                  style: TextStyleClass
                                                      .getTextStyle(
                                                          "weight400", 16.sp),
                                                ),
                                                SizedBox(width: 8.w),
                                                Icon(
                                                  Icons.cancel,
                                                  color: Get.isDarkMode
                                                      ? AppConstans
                                                          .maincolordarktheme
                                                      : AppConstans
                                                          .maincolorlighttheme,
                                                  size: 20.r,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )));
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
