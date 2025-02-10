import 'package:ecommerce/controller/homecon/homecon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/home/containerimage.dart';
import 'package:ecommerce/view/widget/home/listviewoffers.dart';
import 'package:ecommerce/view/widget/home/listviewwidget.dart';
import 'package:ecommerce/view/widget/home/handlingviewviewall.dart';
import 'package:ecommerce/view/widget/home/headerwidget.dart';
import 'package:ecommerce/view/widget/home/searchlistwideget.dart';
import 'package:ecommerce/view/widget/home/searchtextfield.dart';
import 'package:ecommerce/view/widget/home/titles.dart';
import 'package:ecommerce/view/widget/home/upcominglistview.dart';
import 'package:ecommerce/view/widget/mymatches/upcominglisthorizontal.dart';
import 'package:ecommerce/view/widget/mymatches/upcominglistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home12 extends StatelessWidget {
  const Home12({super.key, this.itemsModel});
  final ItemModelJson? itemsModel;

  @override
  Widget build(BuildContext context) {
    Homeimp2 homeimp = Get.put(Homeimp2());
    Settingservices settingservices = Get.find();

    return RefreshIndicator(
      color: Get.isDarkMode
          ? AppConstans.maincolordarktheme
          : AppConstans.maincolorlighttheme,
      onRefresh: () async {
        await homeimp.Refreshdata(homeimp.Catid);
      },
      child: GetBuilder<Homeimp2>(
        builder: (homeimp) => homeimp.statueRequest == StatueRequest.loadinghome
            ? HandlingView()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstans.PaddingHorizontalAuth),
                child: ListView(
                  children: [
                    SizedBox(
                      height: AppConstans.distanceapppar,
                    ),
                    RowHomeScreen(
                      /*the function */
                      onTap: () {},
                      /*the function */

                      text: "60".tr +
                          "${settingservices.sharedPref.getString("username")}" +
                          "!",
                    ),
                    SizedBox(
                      height: AppConstans.Hight * .015,
                    ),
                    SearchTextField(
                      issortedicon: false,
                      onChanged: (Value) {
                        homeimp.onChanging(Value);
                      },
                      hinttext: "65".tr,
                    ),
                    SizedBox(
                      height: AppConstans.Hight * .030,
                    ),
                    homeimp.isshaerching == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Titles(
                                onTap: () {
                                  homeimp.gotoproductdetailsviewallitems();
                                },
                                text1: "62".tr,
                                text2: "64".tr,
                              ),
                              SizedBox(
                                height: AppConstans.Hight * 0.02,
                              ),
                              ListViewItems(homeimp: homeimp),
                              SizedBox(
                                height: AppConstans.Hight * .035,
                              ),
                              ConatinerImage(
                                hight: AppConstans.Hight / 5.5,
                                width: AppConstans.Width / 2,
                                image: homeimp.images,
                                texts: homeimp.texts,
                                index: homeimp.images.length,
                              ),
                              SizedBox(
                                height: AppConstans.Hight * .035,
                              ),
                              Titles(
                                onTap: () {
                                  homeimp.gotoproductdetailsviewalloffers();
                                },
                                text1: "63".tr,
                                text2: "64".tr,
                              ),
                              SizedBox(
                                height: AppConstans.Hight * 0.02,
                              ),
                              ListViewOffers(homeimp: homeimp),
                              SizedBox(
                                height: AppConstans.Hight * .025,
                              ),
                              Titles(
                                onTap: () {
                                  homeimp.gotoproductdetailsviewallitems();
                                },
                                text1: "203".tr,
                                text2: "64".tr,
                              ),
                              SizedBox(
                                height: AppConstans.Hight * 0.02,
                              ),
                              UpComingListViewHorizontal(),
                            ],
                          )
                        : SearchListWidget(
                            SearchList: homeimp.Searchlist,
                          )
                  ],
                ),
              ),
      ),
    );
  }
}
