import 'package:ecommerce/controller/mymatchescon/mymatchescon.dart';
import 'package:ecommerce/core/constans/constansappvalues.dart';
import 'package:ecommerce/data/model/upcoming.dart';
import 'package:ecommerce/view/widget/mymatches/mymatchescontainer.dart';
import 'package:ecommerce/view/widget/sharedwidgets/noitemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpComingListViewHorizontal extends StatelessWidget {
  const UpComingListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    Mymatchesimble mymatchesimble = Get.put(Mymatchesimble());
    return GetBuilder<Mymatchesimble>(
        builder: (mymatchesimble) => mymatchesimble.upcoming.isEmpty
            ? Container(
                height: AppConstans.Hight / 4,
                child: NoItemText(
                  effectiveWidth: AppConstans.Width * 0.035,
                  text: '342'.tr,
                ),
              )
            : SizedBox(
                height: AppConstans.Hight / 3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // physics: const BouncingScrollPhysics(),
                  itemCount: mymatchesimble.upcoming.length,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: AppConstans.PaddingHorizontalAuth),
                          child: MyMatchesContainer(
                            width: AppConstans.Width * .70,
                            hight: AppConstans.Hight / 4,
                            isprice: false,
                            ishistrory: false,
                            upcomingModel: UpcomingModel.fromJson(
                                mymatchesimble.upcoming[index]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ));
  }
}
