import 'package:ecommerce/controller/viewallitemcontroller.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/home/searchlistwideget.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallitem.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallitemssorting.dart';
import 'package:ecommerce/view/widget/sharedwidgets/handlingview.dart';
import 'package:ecommerce/view/widget/home/searchtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewallItems extends StatelessWidget {
  const ViewallItems({super.key});

  @override
  Widget build(BuildContext context) {
    Settingservices settingservices = Get.find();
    ViewallItemsimble viewallItemsimble = Get.put(ViewallItemsimble());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        centerTitle: true,
        title: Appbartext(appbartext: "77".tr),
      ),
      body: RefreshIndicator(
        color: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,
        onRefresh: () async {
          await viewallItemsimble.Refreshdata(viewallItemsimble.Catid);
        },
        child: GetBuilder<ViewallItemsimble>(
          builder: (viewallItemsimble) => viewallItemsimble.statueRequest ==
                  StatueRequest.loadinghome
              ? HandlingViewallitems()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppConstans.commonsizeboxhiggt.h),
                      SearchTextField(
                        issortedicon: true,
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              height: 160.h,
                              width: double.infinity,
                              child: Material(
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppConstans.Radious.r),
                                  topRight:
                                      Radius.circular(AppConstans.Radious.r),
                                ),
                                child: GetBuilder<ViewallItemsimble>(
                                  builder: (viewallItemsimble) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Text(
                                          "78".tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.sp,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      CheckboxListTile(
                                        enabled: viewallItemsimble
                                            .isCheckBoxActivePrices,
                                        title: Text(
                                          "79".tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: viewallItemsimble.IsSortByPrice,
                                        onChanged: (value) {
                                          if (value == true) {
                                            viewallItemsimble.Sort("asc");
                                          } else {
                                            viewallItemsimble.Clearsorting();
                                          }
                                          viewallItemsimble
                                              .onChangedIsSortByPrice(value);
                                          viewallItemsimble
                                              .CheckboxStatuesPrices(value!);
                                        },
                                        activeColor: Get.isDarkMode
                                            ? AppConstans.maincolordarktheme
                                            : AppConstans.maincolorlighttheme,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        onChanged: (value) {
                          viewallItemsimble.onChanging(value);
                        },
                        hinttext: "65".tr,
                      ),
                      SizedBox(height: 15.h),
                      Expanded(
                        child: viewallItemsimble.isshaerching == false
                            ? viewallItemsimble.SortedList.isEmpty
                                ? ListViewallItems(
                                    viewallItemsimble: viewallItemsimble)
                                : ListViewallItemsSorting(
                                    viewallitemsimble: viewallItemsimble)
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SearchListWidget(
                                        SearchList:
                                            viewallItemsimble.Searchlist),
                                  ],
                                ),
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
