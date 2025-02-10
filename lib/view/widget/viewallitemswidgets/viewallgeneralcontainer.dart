import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallitemcontroller.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/offertextwidget.dart';
import 'package:ecommerce/view/widget/sharedwidgets/offerpercentagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsModelClassViewall extends GetView<Homeimp2> {
  const ItemsModelClassViewall(
      {super.key, this.items, this.offeredcontainer = false});
  final ItemModelJson? items;
  final bool offeredcontainer;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ViewallItemsimble viewallItemsimble = Get.put(ViewallItemsimble());
    Homeimp2 homeimp2 = Get.put(Homeimp2());

    return InkWell(
      onTap: () {
        viewallItemsimble!.gotoproductdetails(items);
      },
      child: Column(
        children: [
          Container(
            height: screenHeight * .18,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstans.Radious),
                color: Get.isDarkMode == true
                    ? AppConstans.secondblackcolor
                    : AppConstans.Whitecolor,
                border: Border.all(
                    color: Get.isDarkMode == true
                        ? AppConstans.darkgreycolor
                        : AppConstans.Bordercolor)),
            child: Row(
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppConstans.Radious,
                    ),
                    child: Container(
                      height: screenHeight * .17,
                      width: screenWidth * 0.41,
                      child: CachedNetworkImage(
                        imageUrl: items!.gallery![0].image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  offeredcontainer == true
                      ? OfferConatinerPercentage(
                          discount: items!.discount!.value!.toInt(),
                        )
                      : SizedBox()
                ]),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              translationDataBase(items!.nameAr!, items!.name!),
                              style: TextStyleClass.getTextStyle(
                                "medium",
                                screenWidth * 0.05,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GetBuilder<Homeimp2>(
                              builder: (homeimp2) => IconButton(
                                    onPressed: () {
                                      if (homeimp2.favoriteMap[items!.id] ==
                                          true) {
                                        homeimp2.removefromfavourie(items!.id);
                                        homeimp2.changestatefavourite(
                                            items!.id, false);
                                      } else {
                                        homeimp2.addtofavourite(items!.id,
                                            items!.name, items!.price);
                                        homeimp2.changestatefavourite(
                                            items!.id, true);
                                      }
                                    },
                                    icon: homeimp2.favoriteMap[items!.id] ==
                                            true
                                        ? Icon(Icons.favorite,
                                            color: Get.isDarkMode
                                                ? AppConstans.maincolordarktheme
                                                : AppConstans
                                                    .maincolorlighttheme)
                                        : Icon(Icons.favorite_border,
                                            color: Get.isDarkMode
                                                ? AppConstans.maincolordarktheme
                                                : AppConstans
                                                    .maincolorlighttheme),
                                    padding: EdgeInsets.all(0),
                                  ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              items!.location!,
                              style: TextStyleClass.getTextStyle(
                                  "weight500", screenWidth * 0.038,
                                  color: AppConstans.darkgreycolor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstans.Hight * .01,
                      ),
                      offeredcontainer == true
                          ? TextOfferWidget(
                              textoffer: "today",
                            )
                          : SizedBox(),
                      SizedBox(
                        height: AppConstans.Hight * .01,
                      ),
                      Spacer(),
                      Text(
                        "${items!.price!} " + "76".tr,
                        style: TextStyleClass.getTextStyle(
                            "weight500", AppConstans.Width * .04,
                            color: Get.isDarkMode
                                ? AppConstans.maincolordarktheme
                                : AppConstans.maincolorlighttheme),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
