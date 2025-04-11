import 'package:ecommerce/controller/viewallofferscon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/home/searchlistwideget.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewallofferslist.dart';
import 'package:ecommerce/view/widget/sharedwidgets/handlingview.dart';
import 'package:ecommerce/view/widget/home/searchtextfield.dart';
import 'package:ecommerce/view/widget/viewallitemswidgets/viewalloffersortinglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewallOffersScreen extends StatelessWidget {
  const ViewallOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViewallOffersimble viewallOffersimble = Get.put(ViewallOffersimble());

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
        title: Appbartext(appbartext: "81".tr),
      ),
      body: RefreshIndicator(
        color: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,
        onRefresh: () async {
          viewallOffersimble.Refreshdata(viewallOffersimble.Catid);
        },
        child: GetBuilder<ViewallOffersimble>(
          builder: (viewallOffersimble) {
            if (viewallOffersimble.statueRequest == StatueRequest.loadinghome) {
              return HandlingViewallitems();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: AppConstans.commonsizeboxhiggt.h),
                  // Search TextField
                  SearchTextField(
                    issortedicon: true,
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: 160.h,
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConstans.Radious.r),
                              topRight: Radius.circular(AppConstans.Radious.r),
                            ),
                            child: GetBuilder<ViewallOffersimble>(
                              builder: (viewallOffersimble) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 2.h),
                                      height: 5.h,
                                      width: 90.w,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: Text(
                                      "78".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.sp,
                                      ),
                                    ),
                                  ),
                                  CheckboxListTile(
                                    enabled: viewallOffersimble
                                        .isCheckBoxActivePrices,
                                    title: Text(
                                      "83".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    value: viewallOffersimble.IsSortByPrice,
                                    onChanged: (value) {
                                      if (value == true) {
                                        viewallOffersimble.PaginationSorting(
                                            "asc");
                                      } else {
                                        viewallOffersimble.Clearsorting();
                                      }
                                      viewallOffersimble
                                          .onChangedIsSortByPrice(value);
                                      viewallOffersimble.CheckboxStatuesPrices(
                                          value!);
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
                      viewallOffersimble.onChanging(value);
                    },
                    hinttext: "65".tr,
                  ),
                  SizedBox(height: 15.h),
                  // Ensure scrollability for dynamic lists
                  Expanded(
                    child: viewallOffersimble.isshaerching == false
                        ? viewallOffersimble.SortedList.isEmpty
                            ? ListViewallOffers(
                                viewallOffersimble: viewallOffersimble)
                            : ListViewallOffersSorting(
                                viewallOffersimble: viewallOffersimble)
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                SearchListWidget(
                                    SearchList: viewallOffersimble.Searchlist),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
