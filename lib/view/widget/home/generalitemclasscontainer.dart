import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/offertextwidget.dart';
import 'package:ecommerce/view/widget/sharedwidgets/offerpercentagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemsModelClass extends GetView<Homeimp2> {
  const ItemsModelClass({
    super.key,
    this.items,
    this.offercontainer = false,
  });

  final ItemModelJson? items;
  final bool offercontainer;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Container(
        width: 264.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstans.Radious),
          color: Get.isDarkMode
              ? AppConstans.secondblackcolor
              : AppConstans.Whitecolor,
          border: Border.all(
            color: Get.isDarkMode
                ? AppConstans.darkgreycolor
                : AppConstans.Bordercolor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Get.find<Homeimp2>().gotoproductdetails(items);
              },
              child: Stack(
                children: [
                  Container(
                    height: 145.h,
                    width: 264.w,
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
                  if (offercontainer)
                    OfferConatinerPercentage(
                      discount: items!.discount!.value!.toInt(),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          translationDataBase(items!.nameAr, items!.name),
                          style:
                              TextStyleClass.getTextStyle("weight600", 20.sp),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      GetBuilder<Homeimp2>(
                        builder: (homeimp2) => IconButton(
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
                          icon: Icon(
                            homeimp2.favoriteMap[items!.id] == true
                                ? Icons.favorite_outlined
                                : Icons.favorite_border,
                            color: Get.isDarkMode
                                ? AppConstans.maincolordarktheme
                                : AppConstans.maincolorlighttheme,
                            size: 24.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: 4.h),
                  Text(
                    items!.location!,
                    style: TextStyleClass.getTextStyle("weight500", 12.sp,
                        color: Get.isDarkMode
                            ? AppConstans.Whitecolor
                            : AppConstans.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        "${items!.price!}",
                        style: TextStyleClass.getTextStyle("weight500", 15.sp,
                            color: Get.isDarkMode
                                ? AppConstans.maincolordarktheme
                                : AppConstans.maincolorlighttheme),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "76".tr,
                        style: TextStyleClass.getTextStyle("weight500", 15.sp,
                            color: Get.isDarkMode
                                ? AppConstans.maincolordarktheme
                                : AppConstans.maincolorlighttheme),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  if (offercontainer) TextOfferWidget(textoffer: "today"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
