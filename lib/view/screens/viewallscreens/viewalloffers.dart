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

class ViewallOffersScreen extends StatelessWidget {
  const ViewallOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    ViewallOffersimble viewallOffersimble = Get.put(ViewallOffersimble());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Appbartext(appbartext: "81".tr),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          viewallOffersimble.Refreshfunc(viewallOffersimble.Catid);
        },
        child: GetBuilder<ViewallOffersimble>(
          builder: (viewallOffersimble) {
            if (viewallOffersimble.statueRequest == StatueRequest.loadinghome) {
              return HandlingViewallitems();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * .005),
                  // Search TextField
                  SearchTextField(
                    issortedicon: true,
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: screenHeight * .2,
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConstans.Radious),
                              topRight: Radius.circular(AppConstans.Radious),
                            ),
                            child: GetBuilder<ViewallOffersimble>(
                              builder: (viewallOffersimble) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: screenHeight * .002),
                                      height: screenHeight * .005,
                                      width: AppConstans.Width * .3,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "78".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
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
                                        viewallOffersimble.Sort("asc");
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
                  SizedBox(height: screenHeight * .015),
                  // Ensure scrollability for dynamic lists
                  Expanded(
                    child: viewallOffersimble.isshaerching == false
                        ? viewallOffersimble.SortedList.isEmpty
                            ? ListViewallOffers(
                                viewallOffersimble: viewallOffersimble,
                              )
                            : ListViewallOffersSorting(
                                viewallOffersimble: viewallOffersimble,
                              )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                SearchListWidget(
                                  SearchList: viewallOffersimble.Searchlist,
                                ),
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
