import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/widget/mymatches/mymatcheslistview.dart';
import 'package:ecommerce/view/widget/mymatches/upcominglistview.dart';
import 'package:ecommerce/view/widget/sharedwidgets/handlingview.dart';
import 'package:ecommerce/view/widget/sharedwidgets/noitemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMatchesScreen extends StatelessWidget {
  const MyMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Mymatchesimble mymatchesimble = Get.put(Mymatchesimble());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme,
            labelColor: Get.isDarkMode
                ? AppConstans.maincolordarktheme
                : AppConstans.maincolorlighttheme,
            tabs: [
              Tab(text: '335'.tr), // Upcoming tab
              Tab(text: '336'.tr), // History tab
            ],
          ),
        ),
        body: GetBuilder<Mymatchesimble>(
          builder: (mymatchesimble) {
            if (mymatchesimble.statueRequest == StatueRequest.loadinghome) {
              return HandlingViewallitems();
            }
            return TabBarView(
              children: [
                // ✅ Upcoming Matches Tab ✅
                RefreshIndicator(
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme,
                  onRefresh: () async {
                    await mymatchesimble.refreshdata();
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: mymatchesimble.upcoming.isEmpty
                            ? Center(
                                child: NoItemText(
                                  effectiveWidth: AppConstans.Width * 0.05,
                                  text: '341'.tr,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppConstans.PaddingHorizontalAuth),
                                child: UpComingListView(),
                              ),
                      ),
                    ],
                  ),
                ),

                // ✅ History Matches Tab ✅
                RefreshIndicator(
                  color: Get.isDarkMode
                      ? AppConstans.maincolordarktheme
                      : AppConstans.maincolorlighttheme,
                  onRefresh: () async {
                    await mymatchesimble.refreshdata();
                  },
                  child: Column(children: [
                    Expanded(
                      child: mymatchesimble.history.isEmpty
                          ? Center(
                              child: NoItemText(
                                effectiveWidth: AppConstans.Width * 0.05,
                                text: '342'.tr,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppConstans.PaddingHorizontalAuth),
                              child: MyMatchesListView(),
                            ),
                    ),
                  ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
