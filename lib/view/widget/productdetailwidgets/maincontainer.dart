import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/productdetails.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/amenitieslistview.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/bottomsheet.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/courts.dart';
import 'package:ecommerce/view/widget/productdetailwidgets/datewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainContainerWidget extends StatelessWidget {
  const MainContainerWidget(
      {super.key,
      this.dy,
      this.color,
      this.maintext,
      this.Submaintext,
      this.SubmTitle2,
      this.SubmTitle3,
      this.Title2,
      this.Title4,
      this.Title5,
      this.sizedhight,
      this.minWidth,
      this.Radious,
      this.image,
      this.isimaged,
      this.Radious2,
      this.sizedhight2,
      this.text,
      this.isclicked,
      this.onTaplistview,
      this.mainhighet,
      this.MainRadious,
      this.finaltitle,
      this.TimeSelected,
      this.finaltext});
  final double? dy;
  final double? mainhighet;
  final Color? color;
  final String? maintext;
  final String? Submaintext;
  final String? Title2;
  final String? SubmTitle2;
  final String? SubmTitle3;
  final String? Title4;
  final String? Title5;
  final double? sizedhight;
  final double? minWidth;
  final double? Radious;
  final String? image;
  final bool? isimaged;
  final String? text;

  final double? MainRadious;
  final double? sizedhight2;
  final double? Radious2;
  final bool? isclicked;
  final String? finaltext;
  final void Function()? onTaplistview;
  final String? finaltitle;
  final String? TimeSelected;
  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.put(Settingservices());
    ProductDetailsConimble productDetailsConimble =
        Get.put(ProductDetailsConimble());
    Homeimp2 homeimp2 = Get.put(Homeimp2());
    return SizedBox(
      height: mainhighet,
      child: Transform.translate(
        offset: Offset(0, dy!),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MainRadious!),
            color: color,
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstans.PaddingHorizontalAuth,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstans.distanceapppar,
                ),
                Row(
                  children: [
                    Text(maintext!,
                        style: TextStyleClass.getTextStyle(
                          "bold",
                          AppConstans.Width * .06,
                        )),
                    Spacer(),
                    GetBuilder<Homeimp2>(
                      builder: (homeimp2) => IconButton(
                        onPressed: () {
                          if (homeimp2.favoriteMap[
                                  productDetailsConimble.items.id] ==
                              true) {
                            homeimp2.removefromfavourie(
                                productDetailsConimble.items.id);
                            homeimp2.changestatefavourite(
                                productDetailsConimble.items.id, false);
                          } else {
                            homeimp2.addtofavourite(
                              productDetailsConimble.items.id,
                              productDetailsConimble.items.name,
                              productDetailsConimble.items.price,
                            );
                            homeimp2.changestatefavourite(
                                productDetailsConimble.items.id, true);
                          }
                        },
                        icon: Icon(
                          homeimp2.favoriteMap[
                                      productDetailsConimble.items.id] ==
                                  true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                          size: AppConstans.Width * .07,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                Text(
                  Submaintext!,
                  style: TextStyleClass.getTextStyle(
                      "medium", AppConstans.Width * .045,
                      color: AppConstans.darkgreycolor),
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Title2!,
                          style: TextStyleClass.getTextStyle(
                              "medium", AppConstans.Width * .05),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final Uri phoneUri =
                                    Uri(scheme: 'tel', path: SubmTitle2);

                                try {
                                  if (await canLaunchUrl(phoneUri)) {
                                    await launchUrl(
                                      phoneUri,
                                      mode: LaunchMode
                                          .externalApplication, // Explicitly use external apps
                                    );
                                  } else {
                                    throw 'Could not launch $phoneUri';
                                  }
                                } catch (e) {
                                  print(e); // Log the error for debugging
                                }
                              },
                              child: Row(
                                children: [
                                  Text(
                                    SubmTitle2!,
                                    style: TextStyleClass.getTextStyle(
                                      "bold",
                                      AppConstans.Width * .04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Title4!,
                      style: TextStyleClass.getTextStyle(
                          "medium", AppConstans.Width * .05),
                    ),
                    SizedBox(
                      height: AppConstans.Hight * .01,
                    ),
                    SizedBox(
                        height: sizedhight,
                        child: AmenitiesListView(
                          // text: text!,
                          minWidth: minWidth!,
                          Radious: Radious,
                        )),
                  ],
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Title5!,
                      style: TextStyleClass.getTextStyle(
                          "medium", AppConstans.Width * .05),
                    ),
                    SizedBox(
                      height: AppConstans.Hight * .01,
                    ),
                    SizedBox(
                        height: sizedhight2,
                        child: CourtsListView(
                          Radious2: Radious2,
                        ))
                  ],
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                Text(
                  finaltext!,
                  style: TextStyleClass.getTextStyle(
                      "medium", AppConstans.Width * .05),
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                CustomDatePicker(
                  locale: settingservices.sharedPref.getString("lang")!,
                ),
                SizedBox(
                  height: AppConstans.Hight * .025,
                ),
                InkWell(
                  onTap: () async {
                    print(productDetailsConimble.chosencourtid);

                    if (productDetailsConimble.chosencourtid != null) {
                      await productDetailsConimble.GetAvilableHours(
                        productDetailsConimble.chosencourtid!,
                        productDetailsConimble.dateOnly!,
                      );
                      Get.bottomSheet(
                        MaterialBottomSheet(
                          Mainbottomsheettext: "357".tr,
                        ),
                      );
                    } else {}
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        finaltitle!,
                        style: TextStyleClass.getTextStyle(
                            "medium", AppConstans.Width * .05),
                      ),
                      Spacer(),
                      productDetailsConimble.ChosenHoursList.length == 0
                          ? (productDetailsConimble.chosencourtid == null
                              ? Text("346".tr,
                                  style: TextStyleClass.getTextStyle(
                                      "medium", AppConstans.Width * .032,
                                      color: AppConstans.grey))
                              : Text("347".tr,
                                  style: TextStyleClass.getTextStyle(
                                    "medium",
                                    AppConstans.Width * .05,
                                    color: Get.isDarkMode
                                        ? AppConstans.maincolordarktheme
                                        : AppConstans.maincolorlighttheme,
                                  )))
                          : Text(
                              productDetailsConimble.ChosenHoursList.length == 1
                                  ? productDetailsConimble.ChosenHoursList[0]
                                      .toString()
                                      .substring(
                                        1,
                                      )
                                  : productDetailsConimble.ChosenHoursList[0]
                                          .toString()
                                          .substring(
                                            1,
                                          ) +
                                      "...",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyleClass.getTextStyle(
                                  "weight400", AppConstans.Width * .05,
                                  color: Get.isDarkMode == true
                                      ? AppConstans.Whitecolor
                                      : Color.fromARGB(255, 0, 0, 0))),
                    ],
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
