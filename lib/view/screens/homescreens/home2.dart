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
import 'package:ecommerce/view/widget/mymatches/upcominglisthorizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      height: 16.h,
                    ),
                    RowHomeScreen(
                      /*the function */
                      text3: "pts",
                      /*the function */
                      text2: "20 ",
                      text: "60".tr +
                          "${settingservices.sharedPref.getString("username")}" +
                          "!",
                    ),
                    SizedBox(
                      height: AppConstans.commonsizeboxhiggt,
                    ),
                    SearchTextField(
                      issortedicon: false,
                      onChanged: (Value) {
                        homeimp.onChanging(Value);
                      },
                      hinttext: "65".tr,
                    ),
                    SizedBox(
                      height: AppConstans.commonsizeboxhiggt,
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
                                height: 15.h,
                              ),
                              ListViewItems(homeimp: homeimp),
                              SizedBox(
                                height: AppConstans.commonsizeboxhiggt,
                              ),
                              ConatinerImage(
                                hight: 120.h,
                                width: 182.w,
                                image: homeimp.images,
                                texts: homeimp.texts,
                                index: homeimp.images.length,
                              ),
                              SizedBox(
                                height: AppConstans.commonsizeboxhiggt,
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
                                height: AppConstans.commonsizeboxhiggt,
                              ),
                              Titles(
                                iconneeded: false,
                                text1: "203".tr,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              UpComingListViewHorizontal(),
                              SizedBox(
                                height: 25.h,
                              ),
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
