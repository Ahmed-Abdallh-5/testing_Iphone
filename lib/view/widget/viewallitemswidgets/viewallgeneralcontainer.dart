import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/account/accountcon.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/controller/viewallitemcontroller.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/offertextwidget.dart';
import 'package:ecommerce/view/widget/sharedwidgets/offerpercentagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemsModelClassViewall extends GetView<Homeimp2> {
  const ItemsModelClassViewall(
      {super.key, this.items, this.hight, this.offeredcontainer = false});
  final ItemModelJson? items;
  final bool offeredcontainer;
  final double? hight;

  @override
  Widget build(BuildContext context) {
    ViewallItemsimble viewallItemsimble = Get.put(ViewallItemsimble());
    Homeimp2 homeimp2 = Get.put(Homeimp2());

    return InkWell(
      onTap: () {
        viewallItemsimble!.gotoproductdetails(items);
      },
      child: Column(
        children: [
          Container(
            height: hight,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstans.Radious.r),
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
                      height: hight,
                      width: 160.w,
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
                SizedBox(
                  width: 16.w,
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
                                20.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GetBuilder<Homeimp2>(
                              builder: (homeimp2) => IconButton(
                                    onPressed: () {
                                      MyaccountConimble myaccountConimble =
                                          Get.put(MyaccountConimble());
                                      if (homeimp2.favoriteMap[items!.id] ==
                                          true) {
                                        homeimp2.removefromfavourie(items!.id);
                                        homeimp2.changestatefavourite(
                                            items!.id, false);
                                        myaccountConimble
                                            .deletefromfavouritelist(
                                                items!.id!);
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
                                  "weight500", 12.sp,
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
                      Spacer(),
                      Text(
                        "${items!.price!} " + "76".tr,
                        style: TextStyleClass.getTextStyle("weight500", 15.sp,
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
          SizedBox(
            height: AppConstans.Hight * .02,
          ),
        ],
      ),
    );
  }
}
