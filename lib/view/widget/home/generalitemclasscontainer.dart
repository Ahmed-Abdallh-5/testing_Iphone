import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/offertextwidget.dart';
import 'package:ecommerce/view/widget/sharedwidgets/offerpercentagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsModelClass extends GetView<Homeimp2> {
  const ItemsModelClass(
      {super.key, this.items, this.homeimp2, this.offercontainer = false});
  final ItemModelJson? items;
  final Homeimp2? homeimp2;
  final bool offercontainer;
  @override
  Widget build(BuildContext context) {
    Homeimp2 homeimp2 = Get.put(Homeimp2());
    return Padding(
      padding: EdgeInsets.only(right: AppConstans.PaddingHorizontalAuth),
      child: Container(
        width: AppConstans.Width * .70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstans.Radious),
            color: Get.isDarkMode == true
                ? AppConstans.secondblackcolor
                : AppConstans.Whitecolor,
            border: Border.all(
              color: Get.isDarkMode == true
                  ? AppConstans.darkgreycolor
                  : AppConstans.Bordercolor,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                homeimp2.gotoproductdetails(items);
              },
              child: Stack(children: [
                Container(
                  height: AppConstans.Hight / 5.5,
                  width: AppConstans.Width * .70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstans.Radious),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstans.Radious),
                    child: CachedNetworkImage(
                      imageUrl: items!.gallery![0].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                offercontainer == true
                    ? OfferConatinerPercentage(
                        discount: items!.discount!.value!.toInt(),
                      )
                    : SizedBox()
              ]),
            ),
            SizedBox(
              height: AppConstans.Hight / 120,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstans.Width * .012),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          translationDataBase(items!.nameAr, items!.name),
                          style: TextStyleClass.getTextStyle(
                            "Bold",
                            AppConstans.Width * .055,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      GetBuilder<Homeimp2>(
                        builder: (homeimp2) => Container(
                          height: AppConstans.Hight / 30,
                          width: AppConstans.Hight / 30,
                          child: IconButton(
                            onPressed: () {
                              if (homeimp2.favoriteMap[items!.id] == true) {
                                homeimp2.removefromfavourie(items!.id);
                                homeimp2.changestatefavourite(items!.id, false);
                              } else {
                                homeimp2.addtofavourite(
                                    items!.id, items!.name, items!.price);
                                homeimp2.changestatefavourite(items!.id, true);
                              }
                            },
                            icon: homeimp2.favoriteMap[items!.id] == true
                                ? Icon(
                                    Icons.favorite_outlined,
                                    color: Get.isDarkMode
                                        ? AppConstans.maincolordarktheme
                                        : AppConstans.maincolorlighttheme,
                                    size: AppConstans.Hight / 30,
                                  ) // Set the size of the icon
                                : Icon(
                                    Icons.favorite_border,
                                    color: Get.isDarkMode
                                        ? AppConstans.maincolordarktheme
                                        : AppConstans.maincolorlighttheme,
                                    size: AppConstans.Hight / 30,
                                  ),
                            constraints: BoxConstraints(
                              minWidth: AppConstans.Hight / 30,
                              minHeight: AppConstans.Hight / 30,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        items!.location!,
                        style: TextStyleClass.getTextStyle(
                            "weight500", AppConstans.Hight * .02,
                            color: Get.isDarkMode == true
                                ? AppConstans.Whitecolor
                                : AppConstans.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 120,
                  ),
                  Row(
                    children: [
                      Text(
                        "${items!.price!}",
                        style: TextStyleClass.getTextStyle(
                          "weight500",
                          AppConstans.Width * .045,
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "76".tr,
                        style: TextStyleClass.getTextStyle(
                          "weight500",
                          AppConstans.Width * .045,
                          color: Get.isDarkMode
                              ? AppConstans.maincolordarktheme
                              : AppConstans.maincolorlighttheme,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstans.Hight / 150,
                  ),
                  offercontainer == true
                      ? TextOfferWidget(
                          textoffer: "today",
                        )
                      : SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
