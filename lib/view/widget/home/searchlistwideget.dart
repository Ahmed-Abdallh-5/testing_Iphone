import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/constans/textstyles/text.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({super.key, required this.SearchList});
  final List<ItemModelJson> SearchList;

  @override
  Widget build(BuildContext context) {
    Homeimp2 homeimp = Get.put(Homeimp2());
    return SearchList.length == 0
        ? Center(
            child: Column(
              children: [
                SizedBox(
                  height: AppConstans.Hight / 5,
                  width: AppConstans.Hight / 5,
                  child: LottieBuilder.asset(
                    Get.isDarkMode
                        ? AppConstans.Searchdarktheme
                        : AppConstans.Searchlighttheme,
                  ),
                ),
                Text(
                  "No Result Found",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "We can't find any results related with your keyword",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        : SizedBox(
            height: AppConstans.Hight,
            child: ListView.builder(
                itemCount: SearchList.length,
                shrinkWrap: false,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        homeimp.gotoproductdetails(SearchList[index]);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: AppConstans.Hight * .16,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode == true
                                    ? AppConstans.secondblackcolor
                                    : AppConstans.Whitecolor,
                                borderRadius:
                                    BorderRadius.circular(AppConstans.Radious),
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
                                        height: AppConstans.Hight * .16,
                                        width: AppConstans.Width * 0.41,
                                        child:
                                            SearchList[index].gallery != null &&
                                                    SearchList[index]
                                                        .gallery!
                                                        .isNotEmpty
                                                ? CachedNetworkImage(
                                                    imageUrl: SearchList[index]
                                                            .gallery![0]
                                                            .image ??
                                                        '',
                                                    fit: BoxFit.fill,
                                                  )
                                                : const Placeholder()),
                                  ),
                                ]),
                                SizedBox(
                                  width: AppConstans.Width * .03,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              translationDataBase(
                                                  SearchList[index].nameAr!,
                                                  SearchList[index].name!),
                                              style:
                                                  TextStyleClass.getTextStyle(
                                                "medium",
                                                AppConstans.Width * 0.05,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          GetBuilder<Homeimp2>(
                                              builder: (homeimp2) => IconButton(
                                                    onPressed: () {
                                                      if (homeimp2.favoriteMap[
                                                              SearchList[index]
                                                                  .id] ==
                                                          true) {
                                                        homeimp2
                                                            .removefromfavourie(
                                                                SearchList[
                                                                        index]
                                                                    .id);
                                                        homeimp2
                                                            .changestatefavourite(
                                                                SearchList[
                                                                        index]
                                                                    .id,
                                                                false);
                                                      } else {
                                                        homeimp2.addtofavourite(
                                                            SearchList[index]
                                                                .id,
                                                            SearchList[index]
                                                                .name,
                                                            SearchList[index]
                                                                .price);
                                                        homeimp2
                                                            .changestatefavourite(
                                                                SearchList[
                                                                        index]
                                                                    .id,
                                                                true);
                                                      }
                                                    },
                                                    icon: homeimp2.favoriteMap[
                                                                SearchList[
                                                                        index]
                                                                    .id!] ==
                                                            true
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Get
                                                                    .isDarkMode
                                                                ? AppConstans
                                                                    .maincolordarktheme
                                                                : AppConstans
                                                                    .maincolorlighttheme,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Get
                                                                    .isDarkMode
                                                                ? AppConstans
                                                                    .maincolordarktheme
                                                                : AppConstans
                                                                    .maincolorlighttheme,
                                                          ),
                                                    padding: EdgeInsets.all(0),
                                                  ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              translationDataBase(
                                                  SearchList[index].locationAr!,
                                                  SearchList[index].location!),
                                              style:
                                                  TextStyleClass.getTextStyle(
                                                      "weight400",
                                                      AppConstans.Width * 0.038,
                                                      color: AppConstans
                                                          .darkgreycolor),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: AppConstans.Width * .01,
                                      // ),
                                      SizedBox(
                                        height: AppConstans.Hight * .01,
                                      ),
                                      Spacer(),
                                      Text(
                                        "${SearchList[index].price!} " +
                                            "76".tr,
                                        style: TextStyleClass.getTextStyle(
                                          "weight500",
                                          AppConstans.Width * .04,
                                          color: Get.isDarkMode
                                              ? AppConstans.maincolordarktheme
                                              : AppConstans.maincolorlighttheme,
                                        ),
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
                      ));
                }),
          );
  }
}
