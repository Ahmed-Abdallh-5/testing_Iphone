import 'package:ecommerce/controller/choosecountry/choosecountrycont.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/core/funtions/translationdatabase.dart';
import 'package:ecommerce/core/services/settingservices.dart';
import 'package:ecommerce/view/widget/sharedwidgets/Dropdownsearch.dart';
import 'package:ecommerce/view/widget/authwidgets/authtexts/appbartext.dart';
import 'package:ecommerce/view/widget/home/handlingviewviewall.dart';
import 'package:ecommerce/view/widget/sharedwidgets/sharedbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseCounteyScreen extends StatelessWidget {
  const ChooseCounteyScreen({super.key, this.Selectedcat});

  final int? Selectedcat;

  @override
  Widget build(BuildContext context) {
    ChosseCountryimple chosseCountryimple = Get.put(ChosseCountryimple());
    Settingservices settingservices = Get.find();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Appbartext(appbartext: "70".tr),
      ),
      body: RefreshIndicator(
        color: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,
        onRefresh: () async {
          await chosseCountryimple.Refreshindicatorfunc();
        },
        child: GetBuilder<ChosseCountryimple>(
          builder: (chosseCountryimple) => chosseCountryimple.statueRequest ==
                  StatueRequest.loadinghome
              ? HandlingView()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstans.PaddingHorizontalAuth,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(children: [
                        SizedBox(height: AppConstans.distanceapppar * 2),

                        // Dropdown for countries
                        DropDownWidegt(
                          items: translationDataBase(
                              chosseCountryimple.categorisAR,
                              chosseCountryimple.categoris),
                          hintText: "75".tr,
                          onChanged: (Value, index) {
                            chosseCountryimple.isenabled = true;
                            chosseCountryimple.iscountrychosed = true;
                            chosseCountryimple.selectedCat =
                                chosseCountryimple.categorisIds[index];
                            chosseCountryimple.GetSubdata(
                                chosseCountryimple.selectedCat!);

                            settingservices.sharedPref.setString(
                                "selectedCat", chosseCountryimple.selectedCat!);
                            chosseCountryimple.update();
                          },
                        ),

                        SizedBox(height: AppConstans.Sizeboxsize * 1.5),

                        // Dropdown for districts
                        DropDownWidegt(
                          color: AppConstans.grey,
                          selectedItem:
                              chosseCountryimple.districtsAR.length == 0
                                  ? null
                                  : translationDataBase(
                                      chosseCountryimple.districtsAR[0],
                                      chosseCountryimple.districts[0]),
                          isenabled: chosseCountryimple.isenabled,
                          items: translationDataBase(
                              chosseCountryimple.districtsAR,
                              chosseCountryimple.districts),
                          hintText: "700".tr,
                          onChanged: (Value, index) {
                            chosseCountryimple.selectedDistrict =
                                chosseCountryimple.districtsIds[index];
                            settingservices.sharedPref.setString("selecteddisc",
                                chosseCountryimple.selectedDistrict!);
                            chosseCountryimple.update();
                          },
                        ),
                      ])),
                      Spacer(),
                      Sharedbuttom(
                        isEnabled: chosseCountryimple.iscountrychosed,
                        text: "71".tr,
                        hight: AppConstans.Hight * 0.065,
                        onpreesed: () {
                          chosseCountryimple.gotohomescreen(
                            settingservices.sharedPref
                                .getString("selectedCat")!,
                            district: settingservices.sharedPref
                                .getString("selecteddisc"),
                          );
                        },
                      ),
                      SizedBox(height: AppConstans.Hight * .06)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
