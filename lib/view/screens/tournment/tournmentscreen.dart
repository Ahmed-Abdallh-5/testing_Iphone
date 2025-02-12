import 'package:ecommerce/controller/tornmentcon/tournmentcon.dart';
import 'package:ecommerce/core/classes/statuerequest.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/view/screens/tournment/listviewtournment.dart';
import 'package:ecommerce/view/widget/sharedwidgets/handlingview.dart';
import 'package:ecommerce/view/widget/sharedwidgets/noitemtext.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournmentScreen extends StatelessWidget {
  const TournmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Tournmentconimble tournmentconimble = Get.put(Tournmentconimble());
    return RefreshIndicator(
        color: Get.isDarkMode
            ? AppConstans.maincolordarktheme
            : AppConstans.maincolorlighttheme,
        onRefresh: () async {
          await tournmentconimble.Getdata();
        },
        child: GetBuilder<Tournmentconimble>(
            builder: (tournmentconimble) => tournmentconimble.statueRequest ==
                    StatueRequest.loading
                ? HandlingViewallitems()
                : Scaffold(
                    body: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstans.PaddingHorizontalAuth,
                            ),
                            child: tournmentconimble.tournament.isEmpty
                                ? Center(
                                    child: NoItemText(
                                      effectiveWidth: AppConstans.Width * 0.05,
                                      text: '341'.tr,
                                    ),
                                  )
                                : ListviewTournment(),
                          ),
                        ),
                      ],
                    ),
                  )));
  }
}
