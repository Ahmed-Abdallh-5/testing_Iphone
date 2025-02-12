import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:flutter/material.dart';
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
                margin: EdgeInsets.only(top: AppConstans.Hight / 200),
                height: AppConstans.Hight / 180,
                width: AppConstans.Width / 8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 192, 192, 194),
                  borderRadius: BorderRadius.circular(AppConstans.Width * .02),
                ),
              ),
            ),
            SizedBox(
              height: AppConstans.Hight * .025,
            ),
            Center(
              child: Text(
                Mainbottomsheettext!,
                style: TextStyleClass.getTextStyle(
                  "weight700",
                  AppConstans.Width / 20,
                ),
              ),
            ),
            SizedBox(
              height: AppConstans.Hight * .025,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppConstans.Width * .03),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columns
                    mainAxisSpacing: 10, // Spacing between rows
                    crossAxisSpacing: 10, // Spacing between columns
                    childAspectRatio: 3, // Adjust to control the item size
                  ),
                  itemCount: productDetailsConimble.AvilableHoursList.length,
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
                                productDetailsConimble.RemoveFromBookedlist(
                                    productDetailsConimble
                                        .AvilableHoursList[index]
                                        .split(" - ")[0]);

                                print("removed");
                                print(productDetailsConimble.ChosenHoursList);
                              } else {
                                productDetailsConimble.AddtoBookedlist(
                                    productDetailsConimble
                                        .AvilableHoursList[index]
                                        .split(" - ")[0]);
                                print("added");
                                print(productDetailsConimble.ChosenHoursList);
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
                                        style: TextStyleClass.getTextStyle(
                                            "weight300",
                                            AppConstans.Width * .04),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Get.isDarkMode == true
                                          ? Color.fromARGB(255, 84, 97, 55)
                                          : const Color.fromARGB(
                                              255, 233, 247, 203),
                                      borderRadius: BorderRadius.circular(
                                          AppConstans.Radious),
                                      border: Border.all(
                                          color: Get.isDarkMode == true
                                              ? AppConstans.maincolordarktheme
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
                                            style: TextStyleClass.getTextStyle(
                                                "weight300",
                                                AppConstans.Width * .04),
                                          ),
                                          SizedBox(
                                              width: AppConstans.Width * .02),
                                          Icon(
                                            Icons.cancel,
                                            color: Get.isDarkMode
                                                ? AppConstans.maincolordarktheme
                                                : AppConstans
                                                    .maincolorlighttheme,
                                            size: AppConstans.Width * .055,
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
